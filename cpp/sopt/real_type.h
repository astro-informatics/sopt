#ifndef SOPT_REAL_TYPE_H
#define SOPT_REAL_TYPE_H

#include "sopt/config.h"
#include <complex>
#include <type_traits>

namespace sopt {
namespace details {

// Checks wether a type has contains a type "value_type"
template <typename T, typename Enable = void>
struct HasValueType {
  using Have = char[1];
  using HaveNot = char[2];

  struct Fallback {
    struct value_type {};
  };
  struct Derived : T, Fallback {};
  template <typename U>
  static Have &test(typename U::value_type *);
  template <typename U>
  static HaveNot &test(U *);

 public:
  static constexpr bool value = sizeof(test<Derived>(nullptr)) == sizeof(HaveNot);
};
// Specialization for fundamental type that cannot be derived from
template <typename T>
struct HasValueType<T, typename std::enable_if<std::is_fundamental<T>::value>::type>
    : std::false_type {};
//! Detects whether a class contains a value_type type
template <typename T, bool = details::HasValueType<T>::value>
class has_value_type;
template <typename T>
class has_value_type<T, true> : public std::true_type {};
template <typename T>
class has_value_type<T, false> : public std::false_type {};
//! Computes inner-most element type
template <typename T, bool = has_value_type<T>::value>
class underlying_value_type;
template <typename T>
class underlying_value_type<T, false> {
 public:
  using type = T;
};
template <typename T>
class underlying_value_type<T, true> {
 public:
  using type = typename underlying_value_type<typename T::value_type>::type;
};
}  // namespace details
//! Gets to the underlying real type
template <typename T>
using real_type = details::underlying_value_type<T>;
//! True if underlying type is complex
template <typename T, typename SP = void>
struct is_complex : public std::false_type {};
//! True if underlying type is complex
template <typename T>
struct is_complex<std::complex<T>, void> : public std::true_type {};
}  // namespace sopt
#endif
