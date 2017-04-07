#ifndef SOPT_CHAINED_OPERATORS_H
#define SOPT_CHAINED_OPERATORS_H

#include "sopt/config.h"
#include <type_traits>
#include <vector>
#include "sopt/types.h"

namespace sopt {
  template <class T0, class ... T>
  OperatorFunction<T0> chained_operators(OperatorFunction<T0> const & arg0, T const & ... args) {
    if(sizeof...(args) == 0)
      return arg0;

    OperatorFunction<T0> result = [=](T0& output,  T0 const &input) -> void {
      std::vector<OperatorFunction<T0>> const funcs = {arg0, args...};
      auto first = funcs.rbegin();
      auto const last = funcs.rend();
      T0 buffer;
      if(funcs.size() == 1)
        (*first)(output, input);
      else if(funcs.size() % 2 == 1)
        (*first)(output, input);
      else {
        (*first)(buffer, input);
        first++;
        (*first)(output, buffer);
      }
      for(++first; first != last; first++) {
        (*first)(buffer, output);
        first++;
        (*first)(output, buffer);
      }
    };
    return result;
  }
}
#endif
