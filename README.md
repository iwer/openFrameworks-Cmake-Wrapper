openFrameworks CMake Wrapper projekt
======================================

Wraps all of [openFrameworks](https://openframeworks.cc) Sources and dependencies in a nice CMake target ready to be include in projects. Also provides a method to have cmake scripts for oF addons externally by linking them into place.

## Goals

The aim of this project was to find a way to use openFrameworks libraries as cmake apckages without having to scatter cmake files throughout the openFrameworks tree. This way it would be much easier to set up and maintain.

The openFrameworks tree is added as a git submodule to this project. All of its installation procedures apply as described in the [documentation](https://openframeworks.cc/setup/linux-install/). Under **/openFrameworks_addon_scripts** are `CMakeLists.txt` for some of the openFrameworks addons. They are linked symbolically into the right place in the openFrameworks tree by the shellscript `./scripts/link_ofaddon_cmake_scripts.sh`. A template for those `CMakeLists.txt` files is provided under `./openFrameworks_addon_scripts/addons/CMakeList.txt.template`.

This is tested and used on Ubuntu 19.04. For other operating system several things like finding system libraries and system dependent source files have to be tweaked (The CMakeLists.txt for ofxOsc contains an example of selecting path for different source files for linux and windows). In future versions this may be included in this project, although i don't know if symbolic links will work this way f.e. on Windows.
## Requirements

* C++ Dev Environment
* git
* CMake >= 3.2
## Installation

* Clone this repo
* `cd openFrameworks-Cmake-Wrapper` 
* `git submodule update --init --recursive`
* `./openFrameworks/scripts/linux/ubuntu/install_dependencies.sh`
* `./openFrameworks/scripts/linux/ubuntu/install_codecs.sh`
* `./openFrameworks/scripts/linux/download_libs.sh`
* `./scripts/link_ofaddon_cmake_scripts.sh`
* `cd build`
* `cmake ..`
* `make -j4`
* `sudo make install`

## Usage

Should be as simple as following CMakeLists.txt

```cmake
cmake_minimum_required(VERSION 3.2 FATAL_ERROR)
project(yourApp VERSION 0.0.1 LANGUAGES C CXX)

list(APPEND CMAKE_MODULE_PATH "/full/path/to/openframeworks/installation/lib/cmake/openframeworks")

find_package(openFrameworks 0.10.1 REQUIRED)

add_executable(yourApp main.cpp)
target_link_libraries(yourApp
  OF::openFrameworks
  OF::ofxGui
)

```
