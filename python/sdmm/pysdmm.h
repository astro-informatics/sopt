#ifndef SOPT_PYTHON
#define SOPT_PYTHON
#include <sopt/types.h>
#include <sopt/sdmm.h>




namespace sopt { namespace pySDMM {

  //template<class SCALAR>
  template<class T>
    void c_sdmm_solver(T *input, T *result, const int N){

      sopt::logging::initialize();
      sopt::logging::set_level(SOPT_TEST_DEBUG_LEVEL);

      // Some typedefs for simplicity
      typedef Eigen::Matrix<T, Eigen::Dynamic, 1> t_Vector;
      typedef Eigen::Matrix<T, Eigen::Dynamic, Eigen::Dynamic> t_Matrix;

      t_Matrix const L0 = t_Matrix::Random(N, N) * 2;
      t_Matrix const L1 = t_Matrix::Random(N, N) * 4;
      // Creates the target vectors
      t_Vector const target0 = t_Vector::Random(N);
      t_Vector const target1 = t_Vector::Random(N);

      // Creates the resulting proximal
      // In practice g_0 and g_1 are any functions with the signature
      // void(t_Vector &output, t_Vector::Scalar gamma, t_Vector const &input)
      auto prox_g0 = sopt::proximal::translate(sopt::proximal::EuclidianNorm(), -target0);
      auto prox_g1 = sopt::proximal::translate(sopt::proximal::EuclidianNorm(), -target1);

      typedef sopt::algorithm::SDMM<Eigen::Matrix<std::complex<double>, Eigen::Dynamic,1>::Scalar> SDMM;
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
        .append(prox_g0, L0)
        .append(prox_g1, L1);

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
