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
./openFrameworks/scripts/linux/ubuntu/install_dependencies.sh
./openFrameworks/scripts/linux/ubuntu/install_codecs.sh
./openFrameworks/scripts/linux/download_libs.sh
./openFrameworks/scripts/linux/compileOF.sh
./openFrameworks/scripts/linux/compilePG.sh

# Clone adiitional addon repos
cd ${BASE}/openFrameworks/addons
if [ ! -d "ofxCv" ]; then
    git clone https://github.com/kylemcdonald/ofxCv.git
fi
if [ ! -d "ofxPDSP" ]; then
    git clone https://github.com/npisanti/ofxPDSP.git
fi
if [ ! -d "ofxMSAOpenCL" ]; then
    git clone https://github.com/memo/ofxMSAOpenCL.git
fi
if [ ! -d "ofxMSAPingPong" ]; then
    git clone https://github.com/memo/ofxMSAPingPong.git
fi
if [ ! -d "ofxAutoReloadedShader" ]; then
    git clone https://github.com/andreasmuller/ofxAutoReloadedShader.git
fi
if [ ! -d "ofxPostProcessing" ]; then
    git clone https://github.com/neilmendoza/ofxPostProcessing.git
fi
if [ ! -d "ofxAnimatable" ]; then
    git clone https://github.com/armadillu/ofxAnimatable.git
fi

# Link CMake list scripts for addons
cd ${BASE}
./scripts/link_ofaddon_cmake_scripts.sh

echo "Done."
echo "openFrameworks and addons can now be built:"
echo "   * cd build"
echo "   * cmake .."
echo "   * make -j4"
echo "   * sduo make install"
