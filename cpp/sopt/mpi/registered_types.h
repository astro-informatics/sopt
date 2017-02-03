#ifndef SOPT_MPI_TYPES_H
#define SOPT_MPI_TYPES_H

#include "sopt/config.h"
#ifdef SOPT_MPI
#include <complex>
#include <mpi.h>

namespace sopt {
namespace mpi {
//! Type of an mpi tupe
typedef decltype(MPI_CHAR) MPIType;

//! MPI type associated with a c++ type
template <class T> struct Type;

static_assert(not std::is_same<char, std::int8_t>::value, "");
#define SOPT_MACRO(TYPE)                                                                           \
  template <> struct Type<TYPE> { static const MPIType value; };
SOPT_MACRO(std::int8_t);
SOPT_MACRO(std::int16_t);
SOPT_MACRO(std::int32_t);
SOPT_MACRO(std::int64_t);
SOPT_MACRO(std::uint8_t);
SOPT_MACRO(std::uint16_t);
SOPT_MACRO(std::uint32_t);
SOPT_MACRO(std::uint64_t);

#ifndef SOPT_CHAR_ARCH
SOPT_MACRO(char);
#endif
#ifndef SOPT_LONG_ARCH
SOPT_MACRO(signed long);
#endif
#ifndef SOPT_ULONG_ARCH
SOPT_MACRO(unsigned long);
#endif

SOPT_MACRO(float);
SOPT_MACRO(double);
SOPT_MACRO(long double);
SOPT_MACRO(std::complex<float>);
SOPT_MACRO(std::complex<double>);
SOPT_MACRO(std::complex<long double>);
#undef SOPT_MACRO

//! MPI type associated with a c++ type
template <class T> inline constexpr MPIType registered_type(T const &) { return Type<T>::value; }

namespace details {
//! Defines c++17 metafunction
template <class...> using void_t = void;
}
//! True if the type is registered
template <class T, class = details::void_t<>> class is_registered_type : public std::false_type {};
template <class T>
class is_registered_type<T, details::void_t<decltype(Type<T>::value)>> : public std::true_type {};
} /* sopt::mpi */
} /* sopt */
#endif
#endif /* ifndef SOPT_TYPES */
