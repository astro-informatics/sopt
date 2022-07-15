#include "sopt/maths.h"
#include <Eigen/Dense>
#include <iostream>

int main() {
  Eigen::Vector3f x(1.0, 2.0, 3.0);
  auto dev = sopt::standard_deviation<Eigen::Vector3f>(x);
  std::cout << "the standard deviation of " << x " is " << dev << std::endl
}
