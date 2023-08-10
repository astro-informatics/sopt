#ifndef SOPT_BISECTION_METHOD_H
#define SOPT_BISECTION_METHOD_H
#include "sopt/config.h"
#include <functional>
#include <type_traits>
#include "sopt/exception.h"
#include "sopt/logging.h"
#include "sopt/types.h"

namespace sopt {
//! Find root to a function within an interval
template <typename K>
typename std::enable_if<std::is_same<t_real, K>::value, K>::type bisection_method(
    const K &function_value, const std::function<K(K)> &func, const K &a, const K &b,
    const t_real &rel_convergence = 1e-4);

template <typename K>
typename std::enable_if<std::is_same<t_real, K>::value, K>::type bisection_method(
    const K &function_value, const std::function<K(K)> &func, const K &a, const K &b,
    const t_real &rel_convergence) {
  t_real lower_eta = a;
  t_real upper_eta = b;
  t_real relative_difference = 1;
  t_real eta = (a + b) * 0.5;
  SOPT_LOW_LOG("Starting bisection method over x ∈ [{}, {}], to estimate f(x) = {}", a, b,
               function_value);
  const auto estimate = [&](const K &x) { return func(x) - function_value; };
  const t_real eb = estimate(b);
  const t_real ea = estimate(a);
  if (eb == 0) return b;
  if (ea == 0) return a;
  if ((ea > 0 and eb > 0) or (ea < 0 and eb < 0))
    SOPT_THROW("f(a) = " << ea << " and f(b) = " << eb
                         << " have the wrong sign."
                            "Where a = "
                         << a << " and b = " << b
                         << " Bisection Method not applicable for "
                            "this function.");
  const auto sign = [&](const K &x) { return (x > 0) ? 1 : ((x < 0) ? -1 : 0); };
  // SOPT_LOW_LOG("Convergence when: |f((a+b)/2) -f(x)| < {} or |a - b| < {}", rel_convergence,
  //              rel_convergence);
  while (rel_convergence < relative_difference or
         std::abs(upper_eta - lower_eta) > rel_convergence) {
    if (upper_eta == lower_eta) SOPT_THROW("a == b, something is wrong.");
    eta = (lower_eta + upper_eta) * 0.5;
    auto const function_est = estimate(eta);
    if (sign(estimate(lower_eta)) == sign(estimate(eta)))
      lower_eta = eta;
    else
      upper_eta = eta;
    relative_difference = std::abs(function_est);
    assert(!(estimate(lower_eta) > 0 and estimate(upper_eta) > 0) and
           !(estimate(lower_eta) < 0 and estimate(upper_eta) < 0));
    //   SOPT_LOW_LOG("|f(x_0) - f(x)| = {}, x = {}, [{}, {}]", relative_difference, eta, lower_eta,
    //                upper_eta);
  }
  return eta;
}
}  // namespace sopt
#endif
