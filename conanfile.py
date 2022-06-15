from conan import ConanFile
from conan.tools.cmake import CMake, CMakeToolchain, CMakeDeps
from conan.tools.files import symlinks

class SoptConan(ConanFile):
    name = "sopt"
    version = "4.0.0"
    url = "https://github.com/astro-informatics/sopt"
    license = "GPL-2.0"
    description = "SOPT is an open-source C++ package available under the license below. It performs Sparse OPTimisation using state-of-the-art convex optimisation algorithms. It solves a variety of sparse regularisation problems, including the Sparsity Averaging Reweighted Analysis (SARA) algorithm."

    
    settings = "os", "compiler", "build_type", "arch"
    requires = ["eigen/3.3.7","catch2/2.13.7","benchmark/1.6.0",]
    generators = "CMakeDeps"
    exports_sources = "cpp/*", "cmake_files/*", "CMakeLists.txt"
    options = {"docs":['on','off'],
               "examples":['on','off'],
               "tests":['on','off'],
               "benchmarks":['on','off'],
               "logging":['on','off'],
               "openmp":['on','off'],
               "mpi":['on','off'],
               "coverage":['on','off'],}
    default_options = {"docs": 'off',
                       "examples":'on',
                       "tests": 'on',
                       "benchmarks": 'off',
                       "logging": 'on',
                       "openmp": 'on',
                       "mpi": 'on',
                       "coverage": 'off',}

    def requirements(self):

        if self.options.docs == 'on' or self.options.examples == 'on':
            # To prevent a conflict in the version of zlib required by libtiff and
            # doxygen, override the version of zlib when either of them is required
            self.requires("zlib/1.2.12", override=True)

        if self.options.examples == 'on':
           self.requires("libtiff/4.3.0")

        if self.options.logging == 'on':
            self.requires("spdlog/1.9.2")

        if self.options.docs == 'on':
            self.requires("doxygen/1.9.2")
    
    def generate(self):
        tc = CMakeToolchain(self)

        tc.variables['docs'] = self.options.docs
        tc.variables['examples'] = self.options.examples
        tc.variables['tests'] = self.options.tests
        tc.variables['benchmarks'] = self.options.benchmarks
        tc.variables['logging'] = self.options.logging
        tc.variables['openmp'] = self.options.openmp
        tc.variables['dompi'] = self.options.mpi
        tc.variables['coverage'] = self.options.coverage

        # List cases where we don't use ccache
        if self.options.docs == 'off':
            tc.variables['CMAKE_C_COMPILER_LAUNCHER'] = "ccache"
            tc.variables['CMAKE_CXX_COMPILER_LAUNCHER'] = "ccache"

        tc.variables['CMAKE_VERBOSE_MAKEFILE:BOOL'] = "ON"        
        tc.generate()
    
    def build(self):
        cmake = CMake(self)
        cmake.configure()
        cmake.build()
        
    def package(self):
        cmake = CMake(self)
        cmake.configure()
        cmake.install()

    def package_info(self):
        self.cpp_info.libs = ["sopt"]
