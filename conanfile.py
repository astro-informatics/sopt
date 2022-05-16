from conans import ConanFile, CMake

class SoptConan(ConanFile):
    requires = ["eigen/3.3.7","catch2/2.13.7","benchmark/1.6.0",]
    generators = "cmake"
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
            self.requires("libtiff/4.0.9")

        if self.options.logging == 'on':
            self.requires("spdlog/1.9.2")

        if self.options.docs == 'on':
            self.requires("doxygen/1.9.2")

    def build(self):
      cmake = CMake(self)

      cmake.definitions['docs'] = self.options.docs
      cmake.definitions['examples'] = self.options.examples
      cmake.definitions['tests'] = self.options.tests
      cmake.definitions['benchmarks'] = self.options.benchmarks
      cmake.definitions['logging'] = self.options.logging
      cmake.definitions['openmp'] = self.options.openmp
      cmake.definitions['dompi'] = self.options.mpi
      cmake.definitions['coverage'] = self.options.coverage

      # List cases where we don't use ccache
      if self.options.docs == 'off':
          cmake.definitions['CMAKE_C_COMPILER_LAUNCHER'] = "ccache"
          cmake.definitions['CMAKE_CXX_COMPILER_LAUNCHER'] = "ccache"

      cmake.definitions['CMAKE_VERBOSE_MAKEFILE:BOOL'] = "ON"
      cmake.configure()
      cmake.build()
