#include "sopt/mpi/registered_types.h"

namespace sopt {
namespace mpi {
MPIType const Type<std::int8_t>::value   = MPI_INT8_T;
MPIType const Type<std::int16_t>::value  = MPI_INT16_T;
MPIType const Type<std::int32_t>::value  = MPI_INT32_T;
MPIType const Type<std::int64_t>::value  = MPI_INT64_T;
MPIType const Type<std::uint8_t>::value   = MPI_UINT8_T;
MPIType const Type<std::uint16_t>::value  = MPI_UINT16_T;
MPIType const Type<std::uint32_t>::value  = MPI_UINT32_T;
MPIType const Type<std::uint64_t>::value  = MPI_UINT64_T;

#ifndef SOPT_CHAR_ARCH
MPIType const Type<char>::value           = MPI_CHAR;
#endif
#ifndef SOPT_LONG_ARCH
MPIType const Type<signed long>::value    = MPI_LONG;
#endif
#ifndef SOPT_ULONG_ARCH
MPIType const Type<unsigned long>::value  = MPI_UNSIGNED_LONG;
#endif

MPIType const Type<float>::value        = MPI_FLOAT;
MPIType const Type<double>::value       = MPI_DOUBLE;
MPIType const Type<long double>::value  = MPI_LONG_DOUBLE;
MPIType const Type<std::complex<float>>::value       = MPI_C_FLOAT_COMPLEX;
MPIType const Type<std::complex<double>>::value      = MPI_C_DOUBLE_COMPLEX;
MPIType const Type<std::complex<long double>>::value = MPI_C_LONG_DOUBLE_COMPLEX;

static_assert(is_registered_type<int>::value, "Checking int is registered");
static_assert(is_registered_type<std::complex<double>>::value,
    "Checking complex double is registered");
static_assert(not is_registered_type<std::complex<int>>::value,
    "Checking complex int is NOT registered");
} /* mpi */
} /* sopt */
