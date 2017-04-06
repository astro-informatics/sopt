#ifndef SOPT_CHAINED_OPERATORS_H
#define SOPT_CHAINED_OPERATORS_H

#include "sopt/config.h"
#include <type_traits>
#include <vector>
#include "sopt/types.h"

namespace sopt {
  template <class T0, class ... T>
  OperatorFunction<T0> chained_operators(OperatorFunction<T0> const & arg0, T const & ... args) {
    OperatorFunction<T0> result = [=](T0& output,  T0 const &input) -> void {
      T0 inbuffer = input;
      T0 obuffer;
      std::vector<OperatorFunction<T0>> const funcs = {arg0, args...};
      auto first = funcs.rbegin();
      auto const last = funcs.rend();
      for(; first != last; ++first) {
        (*first)(obuffer, inbuffer);
       inbuffer.swap(obuffer);
      }
      output = inbuffer;
    };
    return result;
  }
}
#endif
