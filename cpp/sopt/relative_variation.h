#ifndef SOPT_RELATIVE_VARIATION_H
#define SOPT_RELATIVE_VARIATION_H

#include "sopt/config.h"
#include <type_traits>
#include <Eigen/Core>
#include "sopt/logging.h"
#include "sopt/maths.h"

namespace sopt {

//! \brief Convergence on relative variation of the solution vector
//! \details If the solution stops changing, convergence is achieved.
template <class TYPE> class RelativeVariation {
public:
  //! Underlying scalar type
  typedef TYPE Scalar;
  //! Underlying scalar type
  typedef typename real_type<Scalar>::type Real;
  //! Maximum variation from one step to the next
  RelativeVariation(Real epsilon) : epsilon_(epsilon), previous(typename Array<Scalar>::Index(0)){};
  //! Copy constructor
  RelativeVariation(RelativeVariation const &c) : epsilon_(c.epsilon_), previous(c.previous){};

  //! True if object has changed by less than epsilon
  template <class T> bool operator()(Eigen::MatrixBase<T> const &input) {
    return operator()(input.array());
  }
  //! True if object has changed by less than epsilon
  template <class T> bool operator()(Eigen::ArrayBase<T> const &input) {
    if(previous.size() != input.size()) {
      previous = input;
      return false;
    }
    auto const norm = (input - previous).matrix().squaredNorm();
    previous = input;
    SOPT_LOW_LOG("    - relative variation: {} <? {}", std::sqrt(norm), epsilon());
    return norm < epsilon() * epsilon();
  }
  //! Allowed variation
  Real epsilon() const { return epsilon_; }
  //! Allowed variation
  RelativeVariation &epsilon(Real &e) const {
    epsilon_ = e;
    return *this;
  }

protected:
  Real epsilon_;
  Array<Scalar> previous;
};

//! \brief Convergence on relative variation of an objective function
//! \details If the value returned by the input functor applied to the solution vector stops
//! changing, then convergence is achieved
template <typename SCALAR, typename RESULT> class RelativeFunctorVariation {
public:
  //! Underlying scalar type of the input vector
  typedef SCALAR Scalar;
  //! Underlying real type of the scalar
  typedef typename real_type<Scalar>::type Real;
  //! Result of applying the functor
  typedef RESULT Result;
  //! Underlying functor type
  typedef std::function<Result(Vector<Scalar> const &)> Functor;
  //! Maximum variation from one step to the next
  RelativeFunctorVariation(Functor const &functor, t_real epsilon = 1e-12)
      : functor_(functor), epsilon_(epsilon), first_(true), current(0) {}

  //! True if object has changed by less than epsilon
  template <class T> bool operator()(Eigen::MatrixBase<T> const &input) {
    auto const prior = current;
    current = functor(input);
    if(first_) {
      first_ = false;
      return false;
    }
    SOPT_LOW_LOG("    - relative variation: |{0} - {1}|/{0} <? {2}", current, prior, epsilon());
    return std::abs(current - prior) / std::abs(current) < epsilon();
  }
  //! Functor for which to check variation
  Functor const &functor() const { return functor_; }
  //! Calls the functor
  Result functor(Vector<Scalar> const &input) const { return functor()(input); }
  RelativeFunctorVariation &functor(Functor const &functor) { functor_ = functor; }
  //! Allowed variation
  Real epsilon() const { return epsilon_; }
  //! Allowed variation
  RelativeFunctorVariation &epsilon(Real &e) const {
    epsilon_ = e;
    return *this;
  }

  //! Resets convergence functor
  void reset() { first_ = true; }

protected:
  Functor functor_;
  Real epsilon_;
  bool first_;
  Result current;
};

} /* sopt  */

#endif
