openFrameworks CMAKE Wrapper projekt
======================================

Wraps all of openFrameworks Sources an dependencies in a nice CMake target ready to be include in projects. Also provides a method to have cmake scripts for oF addons externally by linking them into place.

* Clone this repo
* `git submodule update --init --recursive`
* `./openFrameworks/scripts/linux/download_libs.sh`
* `./scripts/link_ofaddon_cmake_scripts.sh`
* `cd build`
* `cmake ..`
* `make -j4`
* `sudo make install`

