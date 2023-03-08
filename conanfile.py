from conan import ConanFile
from conan.tools.cmake import CMake, CMakeToolchain, CMakeDeps
from conan.tools.files import symlinks
import os

class SoptConan(ConanFile):
    name = "sopt"
    version = "4.0.0"
    url = "https://github.com/astro-informatics/sopt"
    license = "GPL-2.0"
    description = "SOPT is an open-source C++ package available under the license below. It performs Sparse OPTimisation using state-of-the-art convex optimisation algorithms. It solves a variety of sparse regularisation problems, including the Sparsity Averaging Reweighted Analysis (SARA) algorithm."


    settings = "os", "compiler", "build_type", "arch"
    requires = ["eigen/3.3.7","catch2/2.13.7","benchmark/1.6.0", "libtiff/4.4.0",]
    generators = "CMakeDeps"
    exports_sources = "cpp/*", "cmake_files/*", "CMakeLists.txt"
    options = {"docs":['on','off'],
               "examples":['on','off'],
               "tests":['on','off'],
               "benchmarks":['on','off'],
               "logging":['on','off'],
               "openmp":['on','off'],
               "mpi":['on','off'],
               "coverage":['on','off'],
               "cppflow":['on','off'],}
    default_options = {"docs": 'off',
                       "examples":'on',
                       "tests": 'on',
                       "benchmarks": 'off',
                       "logging": 'on',
                       "openmp": 'on',
                       "mpi": 'on',
                       "coverage": 'off',
                       "cppflow": 'off'}

    def requirements(self):

        if self.options.logging == 'on':
            self.requires("spdlog/1.9.2")

    def build_requirements(self):

        if self.options.docs == 'on':
            self.tool_requires("doxygen/1.9.4@#2af713e135f12722e3536808017ba086")

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
        tc.variables['cppflow'] = self.options.cppflow

        # List cases where we don't use ccache
        if ('GITHUB_ACTIONS' in os.environ.keys() and self.options.docs == 'off'):
            tc.variables['CMAKE_C_COMPILER_LAUNCHER'] = "ccache"
            tc.variables['CMAKE_CXX_COMPILER_LAUNCHER'] = "ccache"

        tc.variables['CMAKE_VERBOSE_MAKEFILE:BOOL'] = "ON"
        tc.generate()

        deps = CMakeDeps(self)
        deps.build_context_activated = ["doxygen"]
        deps.generate()

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
