#!/bin/bash

# Make sure we're in base directory 

if [ -f "README.md" ] && [ -d "openFrameworks_addon_scripts" ]; then
    echo " We're in the right place, good!"
else
    echo "This script must be called from the base directory, like:"
    echo "    $ ./install.sh"
    exit 1
fi

BASE=$(pwd)

# Get openFrameworks
git submodule update --init --recursive

# openFrameworks dependencies
sudo ./openFrameworks/scripts/linux/ubuntu/install_dependencies.sh
sudo ./openFrameworks/scripts/linux/ubuntu/install_codecs.sh
./openFrameworks/scripts/linux/download_libs.sh
./openFrameworks/scripts/linux/compileOF.sh
./openFrameworks/scripts/linux/compilePG.sh

# Clone adiitional addon repos
./scripts/clone_addons.sh

# Link CMake list scripts for addons
cd ${BASE}
./scripts/link_ofaddon_cmake_scripts.sh

echo "Done."
echo "openFrameworks and addons can now be built:"
echo "   * cd build"
echo "   * cmake .."
echo "   * make -j4"
echo "   * sudo make install"
