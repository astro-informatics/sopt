from conans import ConanFile, CMake

class SoptTestConan(ConanFile):
    name = "sopt"
    version = "4.0.0"

    def package_info(self):
        self.cpp_info.libs = ["sopt"]

    def test(self):
        cmake = self.cmake_setup()
        cmake.test()
