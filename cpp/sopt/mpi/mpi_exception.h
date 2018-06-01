#ifndef SOPT_MPI_EXCEPTION_H
#define SOPT_MPI_EXCEPTION_H
#include <exception>
#include <mpi.h>
#include "sopt/mpi/communicator.h"
#include "sopt/mpi/session.h"

namespace sopt {
namespace mpi {
class MPIexception : public std::runtime_error {
    public:
      //! Construct exception using MPI_Comm with error code
    	MPIexception(const std::string & msg, MPI_Comm const &comm, const int rank, const int mpi_error_code) : std::runtime_error(msg.c_str())
        {
            fprintf(stderr, "MPI Error on Rank %3d: %s\n", rank, this->what());
            MPI_Abort(comm, mpi_error_code);
        }
      //! Construct exception using MPI_Comm with MPI_ERR_OTHER
    	MPIexception(const std::string& msg, MPI_Comm const &comm, const int rank) : MPIexception(msg, comm, rank, MPI_ERR_OTHER)
        {}
      //! Construct exception using Communicator object with error code
    	MPIexception(const std::string& msg, Communicator const &comm, const int mpi_error_code) : MPIexception(msg, *comm, comm.rank(), mpi_error_code)
        {}
      //! Construct exception using Communicator object with MPI_ERR_OTHER
    	MPIexception(const std::string& msg, Communicator const &comm) : MPIexception(msg, comm, MPI_ERR_OTHER)
        {}

};
}
}
#endif
