from conan import ConanFile
from conan.tools.cmake import CMake, CMakeToolchain, CMakeDeps
from conan.tools.files import symlinks
import os

class soptConan(ConanFile):
    name = "sopt"
    version = "4.0.0"
    url = "https://github.com/astro-informatics/sopt"
    license = "GPL-2.0"
    description = "SOPT is an open-source C++ package available under the license below. It performs Sparse OPTimisation using state-of-the-art convex optimisation algorithms. It solves a variety of sparse regularisation problems, including the Sparsity Averaging Reweighted Analysis (SARA) algorithm."


    settings = "os", "compiler", "build_type", "arch"
    requires = ["eigen/3.4.0","catch2/3.4.0","benchmark/1.8.2", "libtiff/4.5.1",]
    #generators = "CMakeDeps"
    exports_sources = "cpp/*", "cmake_files/*", "CMakeLists.txt"
    options = {"docs":['on','off'],
               "examples":['on','off'],
               "tests":['on','off'],
               "benchmarks":['on','off'],
               "openmp":['on','off'],
               "dompi":['on','off'],
               "coverage":['on','off'],
               "onnxrt":['on','off'],
    default_options = {"docs": 'off',
                       "examples":'on',
                       "tests": 'on',
                       "benchmarks": 'off',
                       "openmp": 'off',
                       "dompi": 'off',
                       "coverage": 'off',
                       "onnxrt": 'off'}

    def requirements(self):

        if self.options.onnxrt == 'on':
            self.requires("onnxruntime/1.16.3")

    def build_requirements(self):

        if self.options.docs == 'on':
            self.tool_requires("doxygen/1.9.4@#2af713e135f12722e3536808017ba086")

    def generate(self):
        tc = CMakeToolchain(self)

        tc.cache_variables['docs'] = self.options.docs
        tc.cache_variables['examples'] = self.options.examples
        tc.cache_variables['tests'] = self.options.tests
        tc.cache_variables['benchmarks'] = self.options.benchmarks
        tc.cache_variables['openmp'] = self.options.openmp
        tc.cache_variables['onnxrt'] = self.options.onnxrt
        tc.cache_variables['dompi'] = self.options.dompi
        tc.cache_variables['coverage'] = self.options.coverage

        # List cases where we don't use ccache
        if ('GITHUB_ACTIONS' in os.environ.keys() and self.options.docs == 'off'):
            tc.cache_variables['CMAKE_C_COMPILER_LAUNCHER'] = "ccache"
            tc.cache_variables['CMAKE_CXX_COMPILER_LAUNCHER'] = "ccache"

        tc.cache_variables['CMAKE_VERBOSE_MAKEFILE:BOOL'] = "ON"
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
