SOPT: Sparse OPTimisation Library [![Build Status](https://travis-ci.com/astro-informatics/sopt.svg?branch=development)](https://travis-ci.com/astro-informatics/sopt)
=================================

Description
-----------

**SOPT** is an opensource `C++` package to perform Sparse OPTimisation. It solves a variety of sparse regularisation
problems, including the Sparsity Averaging Reweighted Analysis (SARA) algorithm. Prototype Matlab implementations of various algorithms are
also included.

Dependencies installation
-------------------------

**SOPT** is mostly written both in `C++11` and `Python`. Pre-requisites and dependencies are listed in following and minimal versions required are tested against `Travis CI` meaning that they come natively with the Ubuntu Trusty release. These are also the default ones fetched by `CMake`.

`C++` minimal dependencies:

- [CMake](http://www.cmake.org/) v3.9.2 A free software that allows cross-platform compilation
- [GCC](https://gcc.gnu.org) v7.3.0 GNU compiler for `C++`
- [UCL/GreatCMakeCookOff](https://github.com/UCL/GreatCMakeCookOff) Collection of `CMake` recipes.
  Downloaded automatically if absent.
- [Eigen3](http://eigen.tuxfamily.org/index.php?title=Main_Page) v3.2.0 (Trusty) Modern `C++` linear algebra.
  Downloaded automatically if absent.
- [tiff](http://www.libtiff.org/) v4.0.3 (Trusty) Tag Image File Format library
- [OpenMP](http://openmp.org/wp/) v4.8.4 (Trusty) - Optional - Speeds up some of the operations.
- [spdlog](https://github.com/gabime/spdlog) v* - Optional - Logging library. Downloaded automatically if
  absent.
- [philsquared/Catch](https://github.com/philsquared/Catch) v2.2.3 - Optional -  A `C++`
  unit-testing framework only needed for testing. Downloaded automatically if absent.
- [google/benchmark](https://github.com/google/benchmark) - Optional - A `C++`
  micro-benchmarking framework only needed for benchmarks. Downloaded automatically if absent.

`Python` dependencies:

- [numpy](http://www.numpy.org/) Fundamental package for scientific computing with `Python`
- [scipy](https://www.scipy.org/) User-friendly and efficient numerical routines such as routines
  for numerical integration and optimization
- [pandas](http://pandas.pydata.org/) Library providing high-performance, easy-to-use data
  structures and data analysis tools
- [cython](http://cython.org/) Makes writing `C` extensions for `Python` as easy as `Python` itself.
  Downloaded automatically if absent.
- [pytest](http://doc.pytest.org/en/latest/) Optional - for testing only. Unit-testing framework
  for python. Downloaded automatically if absent and testing is not disabled.

Installing and building SOPT
----------------------------

**SOPT** can be installed through the software packet manager on Unices distributions, for instance on Ubuntu:

```
apt-get install sopt
```

Alternatively, you can build **SOPT** entirely. Once the mandatory dependencies are present, `git clone` the repository:

```
git clone https://github.com/astro-informatics/sopt.git
```

Then, the program can be built with standard `CMake` command:

```
cd /path/to/code
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
make
```

To install in directory `/X`, with libraries going to `X/lib`, `Python` modules to
`X/lib/pythonA.B/site-packages/sopt`, etc, do:

```
cd /path/to/code/build
cmake -DCMAKE_INSTALL_PREFIX=/X ..
make install
```

Testing
-------

To check everything went all right, run the test suite:

```
cd /path/to/code/build
ctest .
```

Contributors
------------

**SOPT** was initially created by Rafael Carrillo, Jason McEwen and Yves Wiaux but major contributions
have since been made by a number of others. The full list of contributors is as follows:

* [Rafael E. Carrillo](https://www.researchgate.net/profile/Rafael_Carrillo2)
* [Jason D. McEwen](http://www.jasonmcewen.org)
* [Yves Wiaux](http://basp.eps.hw.ac.uk)
* [Vijay Kartik](https://people.epfl.ch/vijay.kartik)
* [Mayeul d'Avezac](https://github.com/mdavezac)
* [Luke Pratley](https://about.me/luke.pratley)
* [David Perez-Suarez](https://dpshelio.github.io)
* [Ilektra Christidi](https://github.com/ilectra)
* [Roland Guichard](https://github.com/UCLGuichard)

References and citation
-----------------------

When referencing this code, please cite our related papers:

1. R. E. Carrillo, J. D. McEwen and Y. Wiaux. "Sparsity Averaging Reweighted
   Analysis (SARA): a novel algorithm for radio-interferometric imaging", Mon.
   Not. Roy. Astron. Soc., 426(2):1223-1234, 2012,
   [arXiv:1205.3123](http://arxiv.org/abs/arXiv:1205.3123)
2. R. E. Carrillo, J. D. McEwen, D. Van De Ville, J.-P. Thiran, and Y. Wiaux.  "Sparsity averaging
   for compressive imaging", IEEE Signal Processing Letters, 20(6):591-594, 2013,
   [arXiv:1208.2330](http://arxiv.org/abs/arXiv:1208.2330)
3. A. Onose, R. E. Carrillo, A. Repetti, J. D. McEwen, J.-P. Thiran, J.-C. Pesquet, and Y. Wiaux.
   "Scalable splitting algorithms for big-data interferometric imaging in the SKA era". Mon. Not.
   Roy. Astron. Soc., 462(4):4314-4335, 2016,
   [arXiv:1601.04026](http://arxiv.org/abs/arXiv:1601.04026)

Webpage
-------

http://astro-informatics.github.io/sopt/


Support
-------

For any questions or comments, feel free to contact [Jason McEwen](jason.mcewen@gmail.com), or add
an issue to the [issue tracker](https://github.com/astro-informatics/sopt/issues).

Notes
-----

The code is given for educational purpose. For the `Matlab` version of the code see the folder matlab.

License
-------

>    SOPT: Sparse OPTimisation package
>    Copyright (C) 2013 Rafael Carrillo, Jason McEwen, Yves Wiaux
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


