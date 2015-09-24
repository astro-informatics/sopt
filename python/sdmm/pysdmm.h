#ifndef SOPT_PYTHON
#define SOPT_PYTHON
#include <sopt/types.h>
#include <sopt/sdmm.h>
namespace sopt { namespace pySDMM {

  template<class T>
    Eigen::Matrix<T, Eigen::Dynamic, Eigen::Dynamic>* proxdata2ptr(T *L_n, 
        const int nrow, const int ncol, const int NPROX){
        typedef Eigen::Matrix<T, Eigen::Dynamic, Eigen::Dynamic> t_Matrix;
        t_Matrix *ptr = new t_Matrix [NPROX];
        for(int i(0); i < NPROX; ++i)
          ptr[i] = Eigen::Map<t_Matrix>(&L_n[nrow * ncol * i], nrow, ncol);
      return(ptr);
    }
  template<class T>
    void c_sdmm_solver(T *input, T *result, T *L_n, T *Tar_n, const int N, const int NPROX){
      sopt::logging::initialize();
      sopt::logging::set_level(SOPT_TEST_DEBUG_LEVEL);
      typedef Eigen::Matrix<T, Eigen::Dynamic, 1> t_Vector;
      typedef Eigen::Matrix<T, Eigen::Dynamic, Eigen::Dynamic> t_Matrix;

      auto ptr_ln = proxdata2ptr(L_n, N, N, NPROX);
      auto ptr_target = proxdata2ptr(Tar_n, N, 1, NPROX);

      // Creates the resulting proximal
      // In practice g_0 and g_1 are any functions with the signature
      // void(t_Vector &output, t_Vector::Scalar gamma, t_Vector const &input)
      auto prox_g0 = sopt::proximal::translate(sopt::proximal::EuclidianNorm(), -ptr_target[0]);
      auto prox_g1 = sopt::proximal::translate(sopt::proximal::EuclidianNorm(), -ptr_target[1]);

      typedef sopt::algorithm::SDMM<Eigen::Matrix<double, Eigen::Dynamic,1>::Scalar> SDMM;

      
      std::shared_ptr<t_Vector> previous;
      auto relative = [&previous](SDMM const&, t_Vector const &candidate) {
        if(not previous) {
          previous = std::make_shared<t_Vector>(candidate);
          return false;
        }
        auto const norm = (*previous - candidate).stableNorm();
        SOPT_INFO("   - Checking convergence {}", norm);
        auto const result = norm < 1e-8 * candidate.size();
        *previous = candidate;
        return result;
      };

      
      auto sdmm = SDMM()
        .itermax(500) // maximum number of iterations
        .gamma(1)
        .conjugate_gradient(std::numeric_limits<sopt::t_uint>::max(), 1e-12)
        .is_converged(relative)
        .append(prox_g0, ptr_ln[0])
        .append(prox_g1, ptr_ln[1]);

      t_Vector c_result;
      auto c_input = Eigen::Map<t_Vector>(&input[0], N);
      auto const diagnostic = sdmm(c_result, c_input);

      for(int i(0); i<N; ++i) // unecessary copy! 
        result[i] = c_result.data()[i];

      if(not diagnostic.good)
        throw std::runtime_error("Did not converge!");
    }

}}
#endif
