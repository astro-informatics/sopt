cmake_minimum_required(VERSION 3.15)
project(SoptPackageTest CXX)

find_package(sopt CONFIG REQUIRED)
find_package(eigen)
find_package(Eigen3)

add_executable(example src/main.cpp)
target_link_libraries(example sopt::sopt)
if(eigen_FOUND)
  target_include_directories(example SYSTEM PUBLIC ${eigen_INCLUDE_DIR})
endif()
if(Eigen3_FOUND)
  target_include_directories(example SYSTEM PUBLIC ${Eigen3_INCLUDE_DIR})
endif()

