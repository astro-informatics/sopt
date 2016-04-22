#ifndef SOPT_SDMM_H
#define SOPT_SDMM_H

#include "sopt/config.h"
#include <limits>
#include <numeric>
#include <vector>
#include "sopt/conjugate_gradient.h"
#include "sopt/exception.h"
#include "sopt/linear_transform.h"
#include "sopt/logging.h"
#include "sopt/proximal.h"
#include "sopt/proximal_expression.h"
#include "sopt/types.h"
#include "sopt/wrapper.h"

namespace sopt {
namespace algorithm {

//! \brief Simultaneous-direction method of the multipliers
//! \details The algorithm is detailed in (doi) 10.1093/mnras/stu202.
template <class SCALAR> class SDMM {
public:
  //! Values indicating how the algorithm ran
  struct Diagnostic {
    //! Number of iterations
    t_uint niters;
    //! Wether convergence was achieved
    bool good;
    //! Conjugate gradient result
    ConjugateGradient::Diagnostic cg_diagnostic;
  };
  struct DiagnosticAndResult : public Diagnostic {
    //! Vector which minimizes the sum of functions.
    Vector<SCALAR> out;
  };
  //! Scalar type
  typedef SCALAR value_type;
  //! Scalar type
  typedef value_type Scalar;
  //! Real type
  typedef typename real_type<Scalar>::type Real;
  //! Type of then underlying vectors
  typedef Vector<SCALAR> t_Vector;
  //! Type of the A and A^H operations
  typedef LinearTransform<t_Vector> t_LinearTransform;
  //! Type of the proximal functions
  typedef ProximalFunction<SCALAR> t_Proximal;
  //! Type of the convergence function
  typedef ConvergenceFunction<SCALAR> t_IsConverged;

  SDMM()
      : itermax_(std::numeric_limits<t_uint>::max()), gamma_(1e-8),
        conjugate_gradient_(std::numeric_limits<t_uint>::max(), 1e-6),
        is_converged_([](t_Vector const &) { return false; }) {}
  virtual ~SDMM() {}

// Macro helps define properties that can be initialized as in
// auto sdmm  = SDMM<float>().prop0(value).prop1(value);
#define SOPT_MACRO(NAME, TYPE)                                                                     \
  TYPE const &NAME() const { return NAME##_; }                                                     \
  SDMM<SCALAR> &NAME(TYPE const &NAME) {                                                           \
    NAME##_ = NAME;                                                                                \
    return *this;                                                                                  \
  }                                                                                                \
                                                                                                   \
protected:                                                                                         \
  TYPE NAME##_;                                                                                    \
                                                                                                   \
public:
  //! Maximum number of iterations
  SOPT_MACRO(itermax, t_uint);
  //! Gamma
  SOPT_MACRO(gamma, Real);
  //! Conjugate gradient
  SOPT_MACRO(conjugate_gradient, ConjugateGradient);
  //! A function verifying convergence
  SOPT_MACRO(is_converged, t_IsConverged);
#undef SOPT_MACRO
  //! Helps setup conjugate gradient
  SDMM<SCALAR> &conjugate_gradient(t_uint itermax, t_real tolerance) {
    conjugate_gradient_.itermax(itermax);
    conjugate_gradient_.tolerance(tolerance);
    return *this;
  }
  //! \brief Appends a proximal and linear transform
  template <class PROXIMAL, class T> SDMM<SCALAR> &append(PROXIMAL proximal, T args) {
    proximals().emplace_back(proximal);
    transforms().emplace_back(linear_transform(args));
    return *this;
  }
  //! \brief Appends a proximal with identity as the linear transform
  template <class PROXIMAL> SDMM<SCALAR> &append(PROXIMAL proximal) {
    return append(proximal, linear_transform_identity<Scalar>());
  }
  //! \brief Appends a proximal with the linear transform as pair of functions
  template <class PROXIMAL, class L, class LADJOINT>
  SDMM<SCALAR> &append(PROXIMAL proximal, L l, LADJOINT ladjoint) {
    return append(proximal, linear_transform<t_Vector>(l, ladjoint));
  }
  //! \brief Appends a proximal with the linear transform as pair of functions
  template <class PROXIMAL, class L, class LADJOINT>
  SDMM<SCALAR> &append(PROXIMAL proximal, L l, LADJOINT ladjoint, std::array<t_int, 3> sizes) {
    return append(proximal, linear_transform<t_Vector>(l, ladjoint, sizes));
  }
  //! \brief Appends a proximal with the linear transform as pair of functions
  template <class PROXIMAL, class L, class LADJOINT>
  SDMM<SCALAR> &append(PROXIMAL proximal, L l, std::array<t_int, 3> dsizes, LADJOINT ladjoint,
                       std::array<t_int, 3> isizes) {
    return append(proximal, linear_transform<t_Vector>(l, dsizes, ladjoint, isizes));
  }

  //! \brief Implements SDMM
  //! \details Follows Combettes and Pesquet "Proximal Splitting Methods in Signal Processing",
  //! arXiv:0912.3522v4 [math.OC] (2010), equation 65.
  //! See therein for notation
  Diagnostic operator()(t_Vector &out, t_Vector const &input) const;
  DiagnosticAndResult operator()(t_Vector const &input) const {
    DiagnosticAndResult result;
    static_cast<Diagnostic &>(result) = operator()(result.out, input);
    return result;
  }
  //! Makes it simple to chain different calls to SDMM
  DiagnosticAndResult operator()(DiagnosticAndResult const &warmstart) const {
    DiagnosticAndResult result;
    static_cast<Diagnostic &>(result) = operator()(result.out, warmstart.out);
    return result;
  }

  //! Linear transforms associated with each objective function
  std::vector<t_LinearTransform> const &transforms() const { return transforms_; }
  //! Linear transforms associated with each objective function
  std::vector<t_LinearTransform> &transforms() { return transforms_; }
  //! Linear transform associated with a given objective function
  t_LinearTransform const &transforms(t_uint i) const { return transforms_[i]; }
  //! Linear transform associated with a given objective function
  t_LinearTransform &transforms(t_uint i) { return transforms_[i]; }

  //! Proximal of each objective function
  std::vector<t_Proximal> const &proximals() const { return proximals_; }
  //! Linear transforms associated with each objective function
  std::vector<t_Proximal> &proximals() { return proximals_; }
  //! Lazy call to specific proximal function
  template <class T0>
  proximal::ProximalExpression<t_Proximal const &, T0>
  proximals(t_uint i, Eigen::MatrixBase<T0> const &x) const {
    return {proximals()[i], gamma(), x};
  }

  //! Number of terms
  t_uint size() const { return proximals().size(); }

  // We must declare the first argument explicitly so that the function never
  // match the getter with the same name.
  //! \brief Forwards to internal conjugage gradient object
  //! \details Removes the need for ugly extra brackets.
  template <class T0, class... T>
  auto conjugate_gradient(T0 &&t0, T &&... args) const
      -> decltype(this->conjugate_gradient()(std::forward<T0>(t0), std::forward<T>(args)...)) {
    return conjugate_gradient()(std::forward<T0>(t0), std::forward<T>(args)...);
  }

  //! Forwards to convergence function parameter
  bool is_converged(t_Vector const &x) const { return is_converged()(x); }

protected:
  //! Linear transforms associated with each objective function
  std::vector<t_LinearTransform> transforms_;
  //! Proximal of each objective function
  std::vector<t_Proximal> proximals_;

  //! Type of the list of vectors
  typedef std::vector<t_Vector> t_Vectors;
  //! Conjugate gradient step
  virtual ConjugateGradient::Diagnostic
  solve_for_xn(t_Vector &out, t_Vectors const &y, t_Vectors const &z) const;
  //! Direction step
  virtual void update_directions(t_Vectors &y, t_Vectors &z, t_Vector const &x) const;

  //! Initializes intermediate values
  virtual void initialization(t_Vectors &y, t_Vectors &z, t_Vector const &x) const;

  //! Checks that the input make sense
  virtual void sanity_check(t_Vector const &input) const;
};

template <class SCALAR>
typename SDMM<SCALAR>::Diagnostic SDMM<SCALAR>::
operator()(t_Vector &out, t_Vector const &input) const {

  sanity_check(input);
  bool convergence = false;
  t_uint niters(0);
  // Figures out where itermax or convergence reached
  auto const has_finished = [&convergence, &niters, this](t_Vector const &out) {
    convergence = is_converged(out);
    return niters >= itermax() or convergence;
  };

  SOPT_NOTICE("Performing SDMM ");
  out = input;
  t_Vectors y(transforms().size()), z(transforms().size());

  // Initial step replaces iteration update with initialization
  SOPT_TRACE("Input {} ", input.transpose());
  initialization(y, z, input);
  auto cg_diagnostic = solve_for_xn(out, y, z);

  while(not has_finished(out)) {
    SOPT_NOTICE("Iteration {}/{}. ", niters, itermax());
    // computes y and z from out and transforms
    update_directions(y, z, out);
    SOPT_NOTICE("   - sum z_ij = {}",
                std::accumulate(z.begin(), z.end(), Scalar(0e0),
                                [](Scalar const &a, t_Vector const &z) { return a + z.sum(); }));
    // computes x = L^-1 y
    cg_diagnostic = solve_for_xn(out, y, z);
    SOPT_NOTICE("   - CG Residual = {} in {}/{} iterations", cg_diagnostic.residual,
                cg_diagnostic.niters, conjugate_gradient().itermax());
    SOPT_TRACE("  - x {}", out.transpose());

    ++niters;
  }
  return {niters, convergence, cg_diagnostic};
}

template <class SCALAR>
ConjugateGradient::Diagnostic
SDMM<SCALAR>::solve_for_xn(t_Vector &out, t_Vectors const &y, t_Vectors const &z) const {

  assert(z.size() == transforms().size());
  assert(y.size() == transforms().size());
  SOPT_INFO("Solving for x_n");

  // Initialize b of A x = b = sum_i L_i^H(z_i - y_i)
  t_Vector b = out.Zero(out.size());
  for(t_uint i(0); i < transforms().size(); ++i)
    b += transforms(i).adjoint() * (y[i] - z[i]);
  if(b.stableNorm() < 1e-12) {
    out.fill(0e0);
    return {0, 0, true};
  }

  // Then create operator A
  auto A = [this](t_Vector &out, t_Vector const &input) {
    out = out.Zero(input.size());
    for(auto const &transform : this->transforms())
      out += transform.adjoint() * (transform * input).eval();
  };

  // Call conjugate gradient
  auto const diagnostic = this->conjugate_gradient(out, A, b);
  if(not diagnostic.good) {
    SOPT_ERROR("CG error - iterations: {}/{} - residuals {}\n", diagnostic.niters,
               conjugate_gradient().itermax(), diagnostic.residual);
    SOPT_THROW("Conjugate gradient failed to converge");
  }

  return diagnostic;
}

template <class SCALAR>
void SDMM<SCALAR>::update_directions(t_Vectors &y, t_Vectors &z, t_Vector const &x) const {
  SOPT_INFO("Updating directions");
  for(t_uint i(0); i < transforms().size(); ++i) {
    z[i] += transforms(i) * x;
    y[i] = proximals(i, z[i]);
    z[i] -= y[i];
  }
}

template <class SCALAR>
void SDMM<SCALAR>::initialization(t_Vectors &y, t_Vectors &z, t_Vector const &x) const {
  SOPT_INFO("Initializing SDMM");
  for(t_uint i(0); i < transforms().size(); i++) {
    y[i] = transforms(i) * x;
    z[i].resize(y[i].size());
    z[i].fill(0);
    assert(z[i].size() == y[i].size());
    SOPT_TRACE("    - transform {}: {}", i, y[i].transpose());
  }
}

template <class SCALAR> void SDMM<SCALAR>::sanity_check(t_Vector const &x) const {
  bool doexit = false;
  if(proximals().size() != transforms().size()) {
    SOPT_ERROR("Internal error: number of proximals and transforms do not match");
    doexit = true;
  }
  if(x.size() == 0)
    SOPT_WARN("Input vector has zero size");
  if(size() == 0)
    SOPT_WARN("No operators - SDMM is empty");
  for(t_uint i(0); i < size(); ++i) {
    auto const xdual = t_Vector::Zero((transforms(i) * x).size());
    auto const r = (transforms(i).adjoint() * xdual).size();
    if(r != x.size()) {
      SOPT_ERROR("Output size of transform {} and input do not match: {} vs {}", i, r, x.size());
      doexit = true;
    }
  }
  if(doexit)
    SOPT_THROW("Input to SDMM is inconsistent");
}
}
} /* sopt::algorithm */
#endif
