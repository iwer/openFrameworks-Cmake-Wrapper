#!/bin/bash

# Make sure we're in base directory 

if [ -f "README.md" ] && [ -d "openFrameworks_addon_scripts" ]; then
    echo ""
else
    echo "This script must be called from the base directory, like:"
    echo "    $ ./install.sh"
    exit 1
fi

BASE=$(pwd)

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
if [ ! -d "ofxDeferredShading" ]; then
    git clone https://github.com/nama-gatsuo/ofxDeferredShading.git
fi
if [ ! -d "ofxGLFog" ]; then
    git clone https://github.com/roymacdonald/ofxGLFog.git
fi
if [ ! -d "ofxDarkKnight" ]; then
    git clone https://github.com/luiscript/ofxDarkKnight.git
fi
if [ ! -d "ofxFX" ]; then
    git clone https://github.com/patriciogonzalezvivo/ofxFX.git
fi
if [ ! -d "ofxPBR" ]; then
    git clone https://github.com/yasuhirohoshino/ofxPBR.git
fi
if [ ! -d "ofxPointInMesh" ]; then
    git clone https://github.com/AmnonOwed/ofxPointInMesh.git
fi
if [ ! -d "ofxMidi" ]; then
    git clone https://github.com/danomatika/ofxMidi.git
fi
if [ ! -d "ofxAudioFile" ]; then
    git clone https://github.com/npisanti/ofxAudioFile.git
fi
if [ ! -d "ofxOpenVR" ]; then
    git clone https://github.com/smallfly/ofxOpenVR.git 
fi
if [ ! -d "ofxHoa" ]; then
    git clone https://github.com/CICM/ofxHoa.git
fi
if [ ! -d "ofxFft" ]; then
    git clone https://github.com/kylemcdonald/ofxFft.git
fi
if [ ! -d "ofxSoundObjects" ]; then
    git clone https://github.com/roymacdonald/ofxSoundObjects.git
fi
