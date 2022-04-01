Sparse OPTimisation Library
===========================

<!-- [![Build Status](https://travis-ci.com/astro-informatics/sopt.svg?branch=development)](https://travis-ci.com/astro-informatics/sopt) -->
[![build](https://img.shields.io/badge/build-passing-brightgreen.svg?style=flat)](https://travis-ci.com/astro-informatics/sopt)
[![codecov](https://codecov.io/gh/astro-informatics/sopt/branch/development/graph/badge.svg)](https://codecov.io/gh/astro-informatics/sopt)
[![DOI](http://img.shields.io/badge/DOI-10.5281/zenodo.2584256-blue.svg?style=flat)](https://doi.org/10.5281/zenodo.2584256)

Description
-------------

**SOPT** is an open-source `C++` package available under the [license](#license) below. It performs Sparse OPTimisation using state-of-the-art convex optimisation algorithms. It solves a variety of sparse regularisation problems, including the Sparsity Averaging Reweighted Analysis (SARA) algorithm. 

**SOPT** also has several MPI wrappers that can be adapted for computational distirbution of various linear operators and convex optimisation algorithms. Wavelet Operators with **SOPT** also support multi-threading through OpenMP.

**SOPT** is written in `C++` primarily but also contains partial and prototyped Matlab implementations of various algorithms.

**SOPT** is largely provided to support the [**PURIFY**](https://github.com/astro-informatics/purify) package, a companion open-source code to perform radio interferometric imaging, also written by the authors of **SOPT**. For further background please see the [reference](#references-and-citation) section.

This documentation outlines the necessary and optional [dependencies](#dependencies-installation) upon which **SOPT** should be built, before describing [installation](#installing-and-building-SOPT) and [testing](#testing) details and [Matlab](#Matlab) support. [Contributors](#contributors), [references](#references-and-citation) and [license](#license) information then follows.

Dependencies installation
-------------------------

**SOPT** is mostly written in `C++11`. Pre-requisites and dependencies are listed in following and minimal versions required are tested against `Travis CI` meaning that they come natively with OSX and the Ubuntu Trusty release. These are also the default ones fetched by `CMake`.

`C++` minimal dependencies:

- [CMake](http://www.cmake.org/) v3.9.2 A free software that allows cross-platform compilation
- [GCC](https://gcc.gnu.org) v7.3.0 GNU compiler for `C++`
- [UCL/GreatCMakeCookOff](https://github.com/UCL/GreatCMakeCookOff) Collection of `CMake` recipes.
  Downloaded automatically if absent.
- [OpenMP](http://openmp.org/wp/) v4.8.4 (Trusty) - Optional - Speeds up some of the operations.
- [Conan](https://docs.conan.io/en/latest/installation.html) - C++ package manager which installs the following:
    - [Eigen3](http://eigen.tuxfamily.org/index.php?title=Main_Page) v3.2.0 (Trusty) Modern `C++` linear algebra.
      Downloaded automatically if absent.
    - [spdlog](https://github.com/gabime/spdlog) v* - Optional - Logging library. Downloaded automatically if
      absent.
    - [Catch2](https://github.com/catchorg/Catch2) v2.2.3 - Optional -  A `C++`
      unit-testing framework only needed for testing. Downloaded automatically if absent.
    - [google/benchmark](https://github.com/google/benchmark) - Optional - A `C++`
      micro-benchmarking framework only needed for benchmarks. Downloaded automatically if absent.
    - [tiff](http://www.libtiff.org/) v4.0.3 (Trusty) Tag Image File Format library - only installed if needed.


Installing and building SOPT
----------------------------

You can build **SOPT** entirely from the source code. Once the mandatory dependencies are present, `git clone` from the [GitHub repository](https://github.com/astro-informatics/sopt):

```
git clone https://github.com/astro-informatics/sopt.git
```

Then, the program can be built with standard `CMake` command:

```
cd /path/to/code
mkdir build
cd build
conan install .. --build missing
conan build ..
```

To install in directory `BUILD_FOLDER`, add the following options to the conan install and build commands:

```
conan install .. --build-missing
conan build .. -bf BUILD_FOLDER -if .
```

Common errors
-------
If you are using the g++ compiler and get an error to do with the package `spdlog`, try adding the option `-s compiler.libcxx=libstdc++11` to the `conan build` command.


Testing
-------

To check everything went all right, run the test suite:

```
cd /path/to/code/build
ctest .
```

Docker
-------

If you want to use Docker instead, you can build an image using the Dockerfile
available in the repository or pulling it from
[DockerHub](https://hub.docker.com/r/uclrits/sopt).

```
docker build -t sopt .
```

or

```
docker pull uclrits/sopt
```


Matlab
------

A separate Matlab implementation is provided with **SOPT**. This implementation includes some (but not all) of the optimisation algorithms implemented in the `C++` code, including the SARA algorithm.

The Matlab implementation is contained in the matlab directory. This is a stand-alone implementation and does not call any of the `C++` code. In future, Matlab interfaces to the `C++` code may also be included in **SOPT**.

See `matlab/README.txt` for an overview of the Matlab implementation. The stand-alone Matlab implementation is also self-documenting; corresponding documentation can be found in `matlab/doc`. We thank Gilles Puy for contributing to this Matlab implementation.

Contributors
------------

Check the [contributors](@ref sopt_contributors) page ([github](cpp/docs/SOPT_CONTRIBUTORS.md)).

References and citation
-----------------------

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

License
-------

>    SOPT: Sparse OPTimisation package
>    Copyright (C) 2013-2019
>
>    This program is free software; you can redistribute it and/or
>    modify it under the terms of the GNU General Public License as
>    published by the Free Software Foundation; either version 2 of the
>    License, or (at your option) any later version.
>
>    This program is distributed in the hope that it will be useful, but
>    WITHOUT ANY WARRANTY; without even the implied warranty of
>    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>    General Public License for more details (LICENSE.txt).
>
>    You should have received a copy of the GNU General Public License
>    along with this program; if not, write to the Free Software
>    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
>    02110-1301, USA.

Webpage
-------

- [Documentation](http://astro-informatics.github.io/sopt)
- [Repository](https://github.com/astro-informatics/sopt)

Support
-------

For any questions or comments, feel free to contact [Jason McEwen](http://www.jasonmcewen.org), or add
an issue to the [issue tracker](https://github.com/astro-informatics/sopt/issues).

Notes
-----

The code is given for educational purpose. For the `Matlab` version of the code see the folder matlab.

