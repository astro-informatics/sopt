#ifndef SOPT_CHAINED_OPERATORS_H
#define SOPT_CHAINED_OPERATORS_H

#include "sopt/config.h"
#include <type_traits>
#include <vector>
#include "sopt/types.h"

namespace sopt {
template <class T0, class... T>
OperatorFunction<T0> chained_operators(OperatorFunction<T0> const &arg0, T const &... args) {
  if(sizeof...(args) == 0)
    return arg0;

  std::vector<OperatorFunction<T0>> const funcs = {arg0, args...};
  const std::shared_ptr<T0> buffer = std::make_shared<T0>();
  OperatorFunction<T0> result = [funcs, buffer](T0 &output, T0 const &input) -> void {
    auto first = funcs.rbegin();
    auto const last = funcs.rend();
    if(funcs.size() == 1)
      (*first)(output, input);
    else if(funcs.size() % 2 == 1)
      (*first)(output, input);
    else {
      (*first)(*buffer, input);
      first++;
      (*first)(output, *buffer);
    }
    for(++first; first != last; first++) {
      (*first)(*buffer, output);
      first++;
      (*first)(output, *buffer);
    }
  };
  return result;
}
} // namespace sopt
#endif
