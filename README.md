# Sparse OPTimisation Library

[![build](https://github.com/astro-informatics/sopt/actions/workflows/cmake.yml/badge.svg?branch=development)](https://github.com/astro-informatics/sopt/actions/workflows/cmake.yml?query=branch%3Adevelopment+)
[![codecov](https://codecov.io/gh/astro-informatics/sopt/branch/development/graph/badge.svg)](https://codecov.io/gh/astro-informatics/sopt)
[![DOI](http://img.shields.io/badge/DOI-10.5281/zenodo.2584256-blue.svg?style=flat)](https://doi.org/10.5281/zenodo.2584256)

## Description

**SOPT** is an open-source `C++` package available under the [license](#license) below. It performs Sparse OPTimisation using state-of-the-art convex optimisation algorithms. It solves a variety of sparse regularisation problems, including the Sparsity Averaging Reweighted Analysis (SARA) algorithm.

**SOPT** also has several MPI wrappers that can be adapted for computational distirbution of various linear operators and convex optimisation algorithms. Wavelet Operators with **SOPT** also support multi-threading through OpenMP.

**SOPT** is written in `C++` primarily but also contains partial and prototyped Matlab implementations of various algorithms.

**SOPT** is largely provided to support the [**PURIFY**](https://github.com/astro-informatics/purify) package, a companion open-source code to perform radio interferometric imaging, also written by the authors of **SOPT**. For further background please see the [reference](#references-and-citation) section.

This documentation outlines the necessary and optional [dependencies](#dependencies-installation) upon which **SOPT** should be built, before describing [installation](#installing-and-building-SOPT) and [testing](#testing) details and [Matlab](#Matlab) support. [Contributors](#contributors), [references](#references-and-citation) and [license](#license) information then follows.

## Dependencies installation

**SOPT** is mostly written in `C++17`. Pre-requisites and dependencies are listed in following and minimal versions required are tested against `Travis CI` meaning that they come natively with OSX and the Ubuntu Trusty release. These are also the default ones fetched by `CMake`.

`C++` minimal dependencies:

- [CMake](http://www.cmake.org/) v3.9.2 A free software that allows cross-platform compilation.
- [GCC](https://gcc.gnu.org) v7.3.0 GNU compiler for `C++`.
- [OpenMP](http://openmp.org/wp/) v4.8.4 (Trusty) - Optional - Speeds up some of the operations.
- [Cppflow](https://github.com/UCL/cppflow) v2.0.0 - Optional - A warpper for the Tensorflow C API allowing us to read Tensorflow models into SOPT. Needed if you are using a learned prior.
- [Eigen3](http://eigen.tuxfamily.org/index.php?title=Main_Page) v3.4.0 (Trusty) Modern `C++` linear algebra. Downloaded automatically if absent.
- [spdlog](https://github.com/gabime/spdlog) v1.12.0 - Optional - Logging library. Downloaded automatically if
    absent.
- [Catch2](https://github.com/catchorg/Catch2) v3.4.0 - Optional -  A `C++`
    unit-testing framework only needed for testing. Downloaded automatically if absent.
- [google/benchmark](https://github.com/google/benchmark) - Optional - A `C++`
    micro-benchmarking framework only needed for benchmarks. Downloaded automatically if absent.
- [tiff](http://www.libtiff.org/) v4.5.1 (Trusty) Tag Image File Format library - only installed if needed.

## Installing and building SOPT

### Using Conan v2 (recommended)

[Conan](https://docs.conan.io/en/latest/installation.html) is a C++ package manager that helps deal with most of the C++ dependencies
as well as the **SOPT** installation:

1. If you are using a learned prior you must install the Tensorflow C API and `cppflow` package:
    - Install [TensorFlow C API](https://www.tensorflow.org/install/lang_c)
    - Clone the UCL fork of cppflow and create a conan package using

        ``` bash
        git clone git@github.com:UCL/cppflow.git
        conan create ./cppflow/
        ```
      Note that conan requires you to specify the host (h) and the build (b) profiles on the command
      line (`-pr:h=default -pr:b=default`), unless you have defined them in your conan profile.
      You can set up a default profile for your system using `conan profile detect` (only needs to be done once).

1. Once the mandatory dependencies are present, `git clone` from the [GitHub repository](https://github.com/astro-informatics/sopt):

    ``` bash
    git clone https://github.com/astro-informatics/sopt.git
    ```

1. Then, the program can be built using conan:

    ``` bash
    cd /path/to/code
    mkdir build
    cd build
    conan install .. -of . --build missing
    conan build .. -of .
    ```

Things to note:

- To install in directory `INSTALL_FOLDER`, add the following options to the conan build command:

    ``` bash
    conan build .. -of INSTALL_FOLDER
    ```

- CMake build options should be passed as options to `conan install` using the `-o` flag with a value `on` or `off`.
Possible options are:

    - tests (default on)
    - benchmarks (default off)
    - examples (default on)
    - logging (default on)
    - openmp (default on)
    - mpi (default on)
    - docs (default off)
    - coverage (default off)
    - cppflow (default off)

For example, to build with both MPI and OpenMP off you would use

``` bash
conan install .. -of . --build missing -o openmp=off -o mpi=off -pr:h=default -pr:b=default
conan build .. -of .
```


### Using CMake

If the dependencies are already available on your system, you can also install **SOPT** manually like so

  ``` bash
  cd /path/to/code
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=${PWD}/../local
  make -j
  make -j install
  ```

On MacOS, you can also install most of the dependencies with Homebrew e.g.

  ``` bash
  brew install libtensorflow eigen tiff spdlog catch2
  ```
**Note that the ONNXruntime interface is currently only supported when compiling with Clang on MacOS, but not with g++**


## Common errors

If you are using the g++ compiler and get an error to do with the package `spdlog`, try adding the option `-s compiler.libcxx=libstdc++11` to the `conan build` command. This option is also necessary when building with gcc on MacOS.


## Conan tips

You can set commonly used options, choices of compilers etc. in a
[conan profile](https://docs.conan.io/en/latest/reference/profiles.html).
You can list profiles available on your system using `conan profile list` and
select the profile you want to use with `conan install` with
`conan install .. -pr my_profile`.
CMake build options can also be added to the profile under `[options]`.
Here is an example of a conan profile for building with a homebrew installed gcc 11 on MacOS.

```
[settings]
os=Macos
os_build=Macos
arch=x86_64
arch_build=x86_64
compiler=gcc
compiler.version=11
compiler.libcxx=libstdc++11
build_type=Release
[options]
[build_requires]
```

## Testing

To check everything went all right, run the test suite:

``` bash
cd /path/to/code/build
ctest .
```

## Matlab

A separate Matlab implementation is provided with **SOPT**.
This implementation includes some (but not all) of the optimisation algorithms implemented in the `C++` code, including the SARA algorithm.

The Matlab implementation is contained in the matlab directory.
This is a stand-alone implementation and does not call any of the `C++` code.
In future, Matlab interfaces to the `C++` code may also be included in **SOPT**.

See `matlab/README.txt` for an overview of the Matlab implementation.
The stand-alone Matlab implementation is also self-documenting;
corresponding documentation can be found in `matlab/doc`.
We thank Gilles Puy for contributing to this Matlab implementation.

## Contributors

Check the [contributors](@ref sopt_contributors) page ([github](cpp/docs/SOPT_CONTRIBUTORS.md)).

## References and citation

If you use **SOPT** for work that results in publication, please reference the [webpage](#webpage) and our related academic papers:

1. L. Pratley _et al._ (to be published)
2. A. Onose, R. E. Carrillo, A. Repetti, J. D. McEwen, J.-P. Thiran, J.-C. Pesquet, and Y. Wiaux.
   "Scalable splitting algorithms for big-data interferometric imaging in the SKA era" _Mon. Not.
   Roy. Astron. Soc._ **462(4):4314-4335** (2016) [arXiv:1601.04026](http://arxiv.org/abs/arXiv:1601.04026)
3. R. E. Carrillo, J. D. McEwen, D. Van De Ville, J.-P. Thiran, and Y. Wiaux.  "Sparsity averaging
   for compressive imaging" _IEEE Signal Processing Letters_ **20(6):591-594** (2013) [arXiv:1208.2330](http://arxiv.org/abs/arXiv:1208.2330)
4. R. E. Carrillo, J. D. McEwen and Y. Wiaux. "Sparsity Averaging Reweighted
   Analysis (SARA): a novel algorithm for radio-interferometric imaging" _Mon.
   Not. Roy. Astron. Soc._ **426(2):1223-1234** (2012) [arXiv:1205.3123](http://arxiv.org/abs/arXiv:1205.3123)

## License

> SOPT: Sparse OPTimisation package
> Copyright (C) 2013-2023
>
> This program is free software; you can redistribute it and/or
> modify it under the terms of the GNU General Public License as
> published by the Free Software Foundation; either version 2 of the
> License, or (at your option) any later version.
>
> This program is distributed in the hope that it will be useful, but
> WITHOUT ANY WARRANTY; without even the implied warranty of
> MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> General Public License for more details (LICENSE.txt).
>
> You should have received a copy of the GNU General Public License
> along with this program; if not, write to the Free Software
> Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
> 02110-1301, USA.

## Webpage

- [Documentation](http://astro-informatics.github.io/sopt)
- [Repository](https://github.com/astro-informatics/sopt)

## Support

For any questions or comments, feel free to contact [Jason McEwen](http://www.jasonmcewen.org), or add
an issue to the [issue tracker](https://github.com/astro-informatics/sopt/issues).

## Notes

The code is given for educational purpose. For the `Matlab` version of the code see the folder matlab.
