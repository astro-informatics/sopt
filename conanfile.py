from conans import ConanFile, CMake

class SoptConan(ConanFile):
    requires = ["eigen/3.3.7","spdlog/1.9.2","catch2/2.13.7","benchmark/1.6.0",]
    generators = "cmake"
    options = {"regressions": ['on','off'],
               "docs":['on','off'],
               "examples":['on','off'],
               "tests":['on','off'],
               "benchmarks":['on','off'],
               "logging":['on','off'],
               "openmp":['on','off'],
               "mpi":['on','off'],
               "coverage":['on','off'],}
    default_options = {"regressions": 'off',
                       "docs": 'off',
                       "examples":'on',
                       "tests": 'on',
                       "benchmarks": 'off',
                       "logging": 'on',
                       "openmp": 'on',
                       "mpi": 'on',
                       "coverage": 'off',}
    
    def requirements(self):
        if self.options.regressions == 'on':
            self.requires("fftw/3.3.9")

        if self.options.examples == 'on' or self.options.regressions == 'on':
            self.requires("libtiff/4.0.9")


    def build(self):
      cmake = CMake(self)
      
      cmake.definitions['regressions'] = self.options.regressions
      cmake.definitions['docs'] = self.options.docs
      cmake.definitions['examples'] = self.options.examples
      cmake.definitions['tests'] = self.options.tests
      cmake.definitions['benchmarks'] = self.options.benchmarks
      cmake.definitions['logging'] = self.options.logging
      cmake.definitions['openmp'] = self.options.openmp
      cmake.definitions['dompi'] = self.options.mpi
      cmake.definitions['coverage'] = self.options.coverage

      cmake.definitions['CMAKE_C_COMPILER_LAUNCHER'] = "ccache"
      cmake.definitions['CMAKE_CXX_COMPILER_LAUNCHER'] = "ccache"
      
      cmake.configure()
      cmake.build()
