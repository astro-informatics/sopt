#ifndef SOPT_UTILITIES_H
#define SOPT_UTILITIES_H

#include <Eigen/Core>
#include "sopt/config.h"
#include "sopt/types.h"

#include <string>

namespace sopt::utilities {

//! Reads tiff image
sopt::Image<> read_tiff(std::string const &name);
//! Writes a tiff greyscale file
void write_tiff(Image<> const &image, std::string const &filename);

//! Exception to be thrown by lexical_cast (below)
struct bad_lexical_cast : public std::runtime_error {
  bad_lexical_cast(const std::string& what) : std::runtime_error(what) {}
};

//! Convert between any types via stringstream
template<typename T, typename U>
T lexical_cast(const U& in) {
  try {
    std::stringstream ss;
    ss << in;
    T out;
    ss >> out;
    return out;
  } catch(const std::exception& e) {
    throw bad_lexical_cast(e.what());
  }
}

//! Split a string on a sepcified delimiter with optional cast to another type
template <typename T = std::string>
std::vector<T> split(std::string s, const std::string& sep) {
  std::vector<T> rtn;
  while (true) {
    const size_t delim_pos = s.find(sep);
    if (delim_pos == std::string::npos)  break;
    const std::string sub = s.substr(0, delim_pos);
    if (sub.length()) {
      if constexpr(std::is_same<T, std::string>::value) {
        rtn.push_back(sub);
      }
      else {
        rtn.push_back(lexical_cast<T>(sub));
      }
    }
    s.replace(0, delim_pos+1, "");
  }
  // check for trailing component
  if (s.length()) {
    if constexpr(std::is_same<T, std::string>::value) {
      rtn.push_back(s);
    }
    else {
      rtn.push_back(lexical_cast<T>(s));
    }
  }
  return rtn;
}

} // namespace sopt::utilities
#endif
