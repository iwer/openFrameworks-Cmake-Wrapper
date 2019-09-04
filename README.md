openFrameworks CMAKE Wrapper projekt
======================================

Wraps all of openFrameworks Sources an dependencies in a nice CMake target ready to be include in projects.

* Clone this repo
* `git submodule update --init --recursive`
* `./openFrameworks/scripts/linux/download_libs.sh`
* `cp -r openFrameworks_addon_scripts/* openFrameworks/`
* `cd build`
* `cmake ..`
* `make -j4`
* `sudo make install`

