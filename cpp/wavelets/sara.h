#ifndef SOPT_WAVELETS_SARA_H
#define SOPT_WAVELETS_SARA_H

#include <vector>
#include <cmath>
#include <initializer_list>
#include <tuple>
#include "wavelets.h"

namespace sopt { namespace wavelets {

//! Sparsity Averaging Reweighted Analysis
class SARA : public std::vector<Wavelet>
{
  public:
    // Constructors
    using std::vector<Wavelet>::vector;
    //! Easier constructor
    SARA(std::initializer_list<std::tuple<std::string, t_uint>> const&init);
    //! Destructor
    virtual ~SARA() {}

    //! \brief Direct transform
    //! \param[in] signal: computes wavelet coefficients for this signal. Its size must be a
    //! multiple of $2^l$ where $l$ is the maximum number of levels. Can be a matrix (2d-transform)
    //! or a column vector (1-d transform).
    //! \return wavelets coefficients arranged by columns: if the input is n by m, then the output
    //! is n by m * d, with d the number of wavelets.
    //! \details Supports 1 and 2 dimensional tranforms for real and complex data.
    template<class T0>
      auto direct(Eigen::ArrayBase<T0> const &signal) const
      -> decltype(this->front().direct(signal));
    //! \brief Direct transform
    //! \param[inout] coefficients: Output wavelet coefficients. Must be of the type as the input.
    //! If the input is n by m, and d is the number of wavelets, then the output should be n by (m *
    //! d).
    //! \param[in] signal: computes wavelet coefficients for this signal. Its size must be a
    //! multiple of $2^l$ where $l$ is the maximum number of levels. Can be a matrix (2d-transform)
    //! or a column vector (1-d transform).
    //! \details Supports 1 and 2 dimensional tranforms for real and complex data.
    template<class T0, class T1>
      auto direct(Eigen::ArrayBase<T1> & coefficients, Eigen::ArrayBase<T0> const &signal) const
      -> decltype(this->front().direct(coefficients, signal));
    //! \brief Direct transform
    //! \param[inout] coefficients: Output wavelet coefficients. Must be of the type as the input.
    //! If the input is n by m, and l is the number of wavelets, then the output should be n by (m *
    //! l).
    //! \param[in] signal: computes wavelet coefficients for this signal. Its size must be a
    //! multiple of $2^l$ where $l$ is the number of levels. Can be a matrix (2d-transform) or a
    //! column vector (1-d transform).
    //! \details Supports 1 and 2 dimensional tranforms for real and complex data. This version
    //! allows non-constant Eigen expressions to be passe on without the ugly `const_cast` of the
    //! cannonical approach.
    template<class T0, class T1>
      auto direct(Eigen::ArrayBase<T1> && coefficients, Eigen::ArrayBase<T0> const &signal) const
      -> decltype(this->front().direct(coefficients, signal)) {
        return (*this)(coefficients, signal);
      }
    //! \brief Indirect transform
    //! \param[in] coefficients: Input wavelet coefficients. Its size must be a multiple of $2^l$
    //! where $l$ is the number of levels. Can be a matrix (2d-transform) or a column vector (1-d
    //! transform).
    //! \details Supports 1 and 2 dimensional tranforms for real and complex data.
    template<class T0>
      auto indirect(Eigen::ArrayBase<T0> const &coefficients) const
      -> decltype(this->front().indirect(coefficients));
    //! \brief Indirect transform
    //! \param[in] coefficients: Input wavelet coefficients. Its size must be a multiple of $2^l$
    //! where $l$ is the number of levels. Can be a matrix (2d-transform) or a column vector (1-d
    //! \param[inout] signal: Reconstructed signal. Must be of the same size and type as the input.
    //! \details Supports 1 and 2 dimensional tranforms for real and complex data.
    template<class T0, class T1>
      auto indirect(Eigen::ArrayBase<T1> const & coefficients, Eigen::ArrayBase<T0> &signal) const
      -> decltype(this->front().indirect(coefficients, signal));
    //! \brief Indirect transform
    //! \param[in] coefficients: Input wavelet coefficients. Its size must be a multiple of $2^l$
    //! where $l$ is the number of levels. Can be a matrix (2d-transform) or a column vector (1-d
    //! \param[inout] signal: Reconstructed signal. Must be of the same size and type as the input.
    //! \details Supports 1 and 2 dimensional tranforms for real and complex data.  This version
    //! allows non-constant Eigen expressions to be passe on without the ugly `const_cast` of the
    //! cannonical approach.
    template<class T0, class T1>
      auto indirect(Eigen::ArrayBase<T1> const & coeffs, Eigen::ArrayBase<T0> &&signal) const
      -> decltype(this->front().indirect(coeffs, signal)) {
        return (*this)(coeffs, signal);
      }

    //! Number of levels over which to do transform
    t_uint max_levels() const {
      auto cmp = [](Wavelet const &a, Wavelet const &b){ return a.levels() < b.levels(); };
      return std::max_element(begin(), end(), cmp)->levels();
    }

    //! Adds a wavelet of specific type
    void emplace_back(std::string const& name, t_uint levels);
};

#define SOPT_WAVELET_ERROR_MACRO(INPUT)                                                        \
    typedef typename T0::Index t_Index;                                                        \
    if(INPUT.rows() % (1u << max_levels()) != 0)                                               \
      throw std::length_error("Inconsistent number of columns and wavelet levels");            \
    else if(INPUT.cols() != 1 and INPUT.cols() % (1u << max_levels()))                         \
      throw std::length_error("Inconsistent number of rows and wavelet levels");

template<class T0, class T1>
  auto SARA::direct(Eigen::ArrayBase<T1> & coeffs, Eigen::ArrayBase<T0> const &signal) const
  -> decltype(this->front().direct(coeffs, signal)) {
    SOPT_WAVELET_ERROR_MACRO(signal);
    if(coeffs.rows() != signal.rows() or coeffs.cols() != signal.cols() * size())
      coeffs.derived().resize(signal.rows(), signal.cols() * size());
    if(coeffs.rows() != signal.rows() or coeffs.cols() != signal.cols() * size())
      throw std::length_error("Incorrect size for output matrix(or could not resize)");
    auto const Ncols = signal.cols();
    t_Index colindex = Ncols;
    for(auto const &wavelet: *this) {
      wavelet.direct(coeffs.leftCols(colindex).rightCols(Ncols), signal);
      colindex += Ncols;
    }
    coeffs /= std::sqrt(size());
  }

template<class T0, class T1>
  auto SARA::indirect(Eigen::ArrayBase<T1> const & coeffs, Eigen::ArrayBase<T0> &signal) const
  -> decltype(this->front().indirect(coeffs, signal)) {
    SOPT_WAVELET_ERROR_MACRO(coeffs);
    if(coeffs.cols() % size() != 0)
      throw std::length_error(
          "Columns of coefficient matrix and number of wavelets are inconsistent");
    if(coeffs.rows() != signal.rows() or coeffs.cols() != signal.cols() * size())
      signal.derived().resize(coeffs.rows(), coeffs.cols() / size());
    if(coeffs.rows() != signal.rows() or coeffs.cols() != signal.cols() * size())
      throw std::length_error("Incorrect size for output matrix(or could not resize)");
    auto const Ncols = signal.cols();
    front().indirect(coeffs.leftCols(Ncols) / std::sqrt(size()), signal);
    for(size_type i(1), colindex(2*Ncols); i < size(); ++i, colindex += Ncols)
      signal += (*this)[i].indirect(coeffs.leftCols(colindex).rightCols(Ncols))
                / std::sqrt(size());
  }

# undef SOPT_WAVELET_ERROR_MACRO

template<class T0>
  auto SARA::indirect(Eigen::ArrayBase<T0> const &coeffs) const
  -> decltype(this->front().indirect(coeffs)) {
    typedef decltype(this->front().indirect(coeffs)) t_Output;
    t_Output signal = t_Output::Zero(coeffs.rows(), coeffs.cols() / size());
    (*this).indirect(coeffs, signal);
    return signal;
  }

template<class T0>
  auto SARA::direct(Eigen::ArrayBase<T0> const &signal) const
  -> decltype(this->front().direct(signal)) {
    typedef decltype(this->front().direct(signal)) t_Output;
    t_Output result = t_Output::Zero(signal.rows(), signal.cols() * size());
    (*this).direct(result, signal);
    return result;
  }

}}
#endif
