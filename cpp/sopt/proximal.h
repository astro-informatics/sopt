#ifndef SOPT_PROXIMAL_H
#define SOPT_PROXIMAL_H

#include "sopt/config.h"
#include <type_traits>
#include <Eigen/Core>
#include "sopt/maths.h"
#include "sopt/proximal_expression.h"
#ifdef SOPT_MPI
#include "sopt/mpi/communicator.h"
#include "sopt/mpi/utilities.h"
#endif

namespace sopt {
//! Holds some standard proximals
namespace proximal {

//! Proximal of euclidian norm
class EuclidianNorm {
public:
#ifdef SOPT_MPI
  EuclidianNorm(mpi::Communicator const &comm = mpi::Communicator()) : comm_(comm){};
  mpi::Communicator communicator() const { return comm_; }
  void communicator(mpi::Communicator const &comm) { comm_ = comm; }
#endif
  template <class T0>
  void operator()(Vector<typename T0::Scalar> &out,
                  typename real_type<typename T0::Scalar>::type const &t,
                  Eigen::MatrixBase<T0> const &x) const {
    typedef typename T0::Scalar Scalar;
#ifdef SOPT_MPI
    auto const norm = mpi::l2_norm(x, comm_);
#else
    auto const norm = x.stableNorm();
#endif
    if(norm > t)
      out = (Scalar(1) - t / norm) * x;
    else
      out.fill(0);
  }
  //! Lazy version
  template <class T0>
  ProximalExpression<EuclidianNorm, T0>
  operator()(typename T0::Scalar const &t, Eigen::MatrixBase<T0> const &x) const {
    return {*this, t, x};
  }
#ifdef SOPT_MPI
private:
  mpi::Communicator comm_;
#endif
};

//! Proximal of the euclidian norm
template <class T0>
auto euclidian_norm(typename real_type<typename T0::Scalar>::type const &t,
                    Eigen::MatrixBase<T0> const &x) -> decltype(EuclidianNorm(), t, x) {
  return EuclidianNorm()(t, x);
}

//! Proximal of the l1 norm
template <class T0, class T1>
void l1_norm(Eigen::DenseBase<T0> &out, typename real_type<typename T0::Scalar>::type gamma,
             Eigen::DenseBase<T1> const &x) {
  out = sopt::soft_threshhold(x, gamma);
}

//! \brief Proximal of the l1 norm
//! \detail This specialization makes it easier to use in algorithms, e.g. within `SDMM::append`.
template <class S>
void l1_norm(Vector<S> &out, typename real_type<S>::type gamma, Vector<S> const &x) {
  l1_norm<Vector<S>, Vector<S>>(out, gamma, x);
}

//! \brief Proximal of l1 norm
//! \details For more complex version involving linear transforms and weights, see L1TightFrame and
//! L1 classes. In practice, this is an alias for soft_threshhold.
template <class T>
auto l1_norm(typename real_type<typename T::Scalar>::type gamma, Eigen::DenseBase<T> const &x)
    -> decltype(sopt::soft_threshhold(x, gamma)) {
  return sopt::soft_threshhold(x, gamma);
}

//! Proximal for projection on the positive quadrant
template <class T>
void positive_quadrant(Vector<T> &out, typename real_type<T>::type, Vector<T> const &x) {
  out = sopt::positive_quadrant(x);
};

//! Proximal for indicator function of L2 ball
template <class T> class L2Ball {
public:
  typedef typename real_type<T>::type Real;
//! Constructs an L2 ball proximal of size epsilon
#ifdef SOPT_MPI
  L2Ball(Real epsilon, mpi::Communicator const &comm = mpi::Communicator())
      : epsilon_(epsilon), comm_(comm){};
#else
  L2Ball(Real epsilon) : epsilon_(epsilon) {}
#endif

  //! Calls proximal function
  void operator()(Vector<T> &out, typename real_type<T>::type, Vector<T> const &x) const {
    return operator()(out, x);
  }
  //! Calls proximal function
  void operator()(Vector<T> &out, Vector<T> const &x) const {
#ifdef SOPT_MPI
    auto const norm = mpi::l2_norm(x, comm_);
#else
    auto const norm = x.stableNorm();
#endif
    if(norm > epsilon())
      out = x * (epsilon() / norm);
    else
      out = x;
  }
  //! Lazy version
  template <class T0>
  EnveloppeExpression<L2Ball, T0> operator()(Real const &, Eigen::MatrixBase<T0> const &x) const {
    return {*this, x};
  }

  //! Lazy version
  template <class T0>
  EnveloppeExpression<L2Ball, T0> operator()(Eigen::MatrixBase<T0> const &x) const {
    return {*this, x};
  }

  //! Size of the ball
  Real epsilon() const { return epsilon_; }
  //! Size of the ball
  L2Ball<T> &epsilon(Real eps) {
    epsilon_ = eps;
    return *this;
  }

#ifdef SOPT_MPI
  mpi::Communicator const &communicator() const { return comm_; }
  void communicator(mpi::Communicator const &comm) { comm_ = comm; }
#endif

private:
  //! Size of the ball
  Real epsilon_;
#ifdef SOPT_MPI
  mpi::Communicator comm_;
#endif
};

template <class T> class WeightedL2Ball : public L2Ball<T> {

public:
  typedef typename L2Ball<T>::Real Real;
  typedef Vector<Real> t_Vector;
#ifdef SOPT_MPI
  //! Constructs an L2 ball proximal of size epsilon with given weights
  template <class T0>
  WeightedL2Ball(Real epsilon, Eigen::DenseBase<T0> const &w,
                 mpi::Communicator const &comm = mpi::Communicator())
      : L2Ball<T>(epsilon, comm), weights_(w) {}
  //! Constructs an L2 ball proximal of size epsilon
  WeightedL2Ball(Real epsilon, mpi::Communicator const &comm = mpi::Communicator())
      : WeightedL2Ball(epsilon, t_Vector::Ones(1), comm) {}
  using L2Ball<T>::communicator;
#else
  //! Constructs an L2 ball proximal of size epsilon with given weights
  template <class T0>
  WeightedL2Ball(Real epsilon, Eigen::DenseBase<T0> const &w) : L2Ball<T>(epsilon), weights_(w) {}
  //! Constructs an L2 ball proximal of size epsilon
  WeightedL2Ball(Real epsilon) : WeightedL2Ball(epsilon, t_Vector::Ones(1)) {}
#endif

  //! Calls proximal function
  void operator()(Vector<T> &out, typename real_type<T>::type, Vector<T> const &x) const {
    return operator()(out, x);
  }
  //! Calls proximal function
  void operator()(Vector<T> &out, Vector<T> const &x) const {
#ifdef SOPT_MPI
    auto const norm = weights().size() == 1 ?
                          mpi::l2_norm(x, communicator()) * std::abs(weights()(0)) :
                          mpi::l2_norm((x.array() * weights().array()).matrix(), communicator());
#else
    auto const norm = weights().size() == 1 ? x.stableNorm() * std::abs(weights()(0)) :
                                              (x.array() * weights().array()).matrix().stableNorm();
#endif
    if(norm > epsilon())
      out = x * (epsilon() / norm);
    else
      out = x;
  }
  //! Lazy version
  template <class T0>
  EnveloppeExpression<WeightedL2Ball, T0>
  operator()(Real const &, Eigen::MatrixBase<T0> const &x) const {
    return {*this, x};
  }
  //! Lazy version
  template <class T0>
  EnveloppeExpression<WeightedL2Ball, T0> operator()(Eigen::MatrixBase<T0> const &x) const {
    return {*this, x};
  }

  //! Weights associated with each dimension
  t_Vector const &weights() const { return weights_; }
  //! Weights associated with each dimension
  template <class T0> WeightedL2Ball<T> &weights(Eigen::MatrixBase<T0> const &w) {
    if((w.array() < 0e0).any())
      SOPT_THROW("Weights cannot be negative");
    if(w.stableNorm() < 1e-12)
      SOPT_THROW("Weights cannot be null");
    weights_ = w;
    return *this;
  }
  //! Size of the ball
  Real epsilon() const { return L2Ball<T>::epsilon(); }
  //! Size of the ball
  WeightedL2Ball<T> &epsilon(Real const &eps) {
    L2Ball<T>::epsilon(eps);
    return *this;
  }

private:
  t_Vector weights_;
};

//! Translation over proximal function
template <class FUNCTION, class VECTOR> class Translation {
public:
  //! Creates proximal of translated function
  template <class T_VECTOR>
  Translation(FUNCTION const &func, T_VECTOR const &trans) : func(func), trans(trans) {}
  //! Computes proximal of translated function
  template <class OUTPUT, class T0>
  typename std::enable_if<std::is_reference<OUTPUT>::value, void>::type
  operator()(OUTPUT out, typename real_type<typename T0::Scalar>::type const &t,
             Eigen::MatrixBase<T0> const &x) const {
    func(out, t, x + trans);
    out -= trans;
  }
  //! Computes proximal of translated function
  template <class T0>
  void operator()(Vector<typename T0::Scalar> &out,
                  typename real_type<typename T0::Scalar>::type const &t,
                  Eigen::MatrixBase<T0> const &x) const {
    func(out, t, x + trans);
    out -= trans;
  }
  //! Lazy version
  template <class T0>
  ProximalExpression<Translation<FUNCTION, VECTOR> const &, T0>
  operator()(typename T0::Scalar const &t, Eigen::MatrixBase<T0> const &x) const {
    return {*this, t, x};
  }

private:
  //! Function to translate
  FUNCTION const func;
  //! Translation
  VECTOR const trans;
};

//! Translates given proximal by given vector
template <class FUNCTION, class VECTOR>
Translation<FUNCTION, VECTOR> translate(FUNCTION const &func, VECTOR const &translation) {
  return Translation<FUNCTION, VECTOR>(func, translation);
}
}
} /* sopt::proximal */

#endif
