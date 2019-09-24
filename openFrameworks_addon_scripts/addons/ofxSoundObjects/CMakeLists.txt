get_filename_component(ADDON_ROOT ${CMAKE_CURRENT_LIST_FILE} PATH)
get_filename_component(ADDON_NAME ${ADDON_ROOT} NAME)

message(STATUS "-------------------------------- Configuring OF Addon '${ADDON_NAME}'")

set(ADDON_SRC 
    ${ADDON_ROOT}/src/ofxSoundMixer.cpp
    ${ADDON_ROOT}/src/ofxSoundRecorderObject.cpp
    ${ADDON_ROOT}/src/ofxSoundFile.cpp
    ${ADDON_ROOT}/src/ofxSoundPlayerObject.cpp
    ${ADDON_ROOT}/src/ofxSoundUtils.cpp
    ${ADDON_ROOT}/src/ofxSoundObject.cpp
    ${ADDON_ROOT}/src/SoundObjects/VUMeter.cpp
    ${ADDON_ROOT}/src/SoundObjects/waveformDraw.cpp
    ${ADDON_ROOT}/src/Renderers/ofxSlidersGrid.cpp
    ${ADDON_ROOT}/src/Renderers/ofxSoundObjectBaseRenderer.cpp
    ${ADDON_ROOT}/src/Renderers/ofx2DCanvas.cpp
    ${ADDON_ROOT}/src/Renderers/ofxSoundObjectMatrixMixerRenderer.cpp
    ${ADDON_ROOT}/src/ofxSoundMatrixMixer.cpp
    ${ADDON_ROOT}/src/ofxSoundMultiplexer.cpp
    ${ADDON_ROOT}/src/ofxSoundMixer.h
    ${ADDON_ROOT}/src/ofxSoundUtils.h
    ${ADDON_ROOT}/src/ofxSoundMatrixMixer.h
    ${ADDON_ROOT}/src/ofxSoundObject.h
    ${ADDON_ROOT}/src/ofxSoundFile.h
    ${ADDON_ROOT}/src/ofxSoundObjects.h
    ${ADDON_ROOT}/src/ofxSoundPlayerObject.h
    ${ADDON_ROOT}/src/SoundObjects/waveformDraw.h
    ${ADDON_ROOT}/src/SoundObjects/DigitalDelay.h
    ${ADDON_ROOT}/src/SoundObjects/LowPassFilter.h
    ${ADDON_ROOT}/src/SoundObjects/VUMeter.h
    ${ADDON_ROOT}/src/SoundObjects/SineWaveGenerator.h
    ${ADDON_ROOT}/src/SoundObjects/NoiseGenerator.h
    ${ADDON_ROOT}/src/ofxSoundObjectsConstants.h
    ${ADDON_ROOT}/src/ofxSoundRecorderObject.h
    ${ADDON_ROOT}/src/Renderers/ofxSlidersGrid.h
    ${ADDON_ROOT}/src/Renderers/ofx2DCanvas.h
    ${ADDON_ROOT}/src/Renderers/ofxSoundObjectMatrixMixerRenderer.h
    ${ADDON_ROOT}/src/Renderers/ofxSoundObjectBaseRenderer.h
    ${ADDON_ROOT}/src/Renderers/ofxSoundRendererUtils.h
    ${ADDON_ROOT}/src/ofxSoundMultiplexer.h

)
set(ADDON_HDR
   # not used, but where supposed to be only header filenames without path for installation. Now solved with cmake filters.
)

add_library(${ADDON_NAME} 
    ${ADDON_SRC}
)
add_library(OF::${ADDON_NAME} ALIAS ${ADDON_NAME})
add_dependencies(${ADDON_NAME} openframeworks)

target_link_libraries(${ADDON_NAME} 
    openframeworks
    ofxAudioFile
    ofxFft
    # system libraries either by their linkname (-lfoo) 
    # or by the variable defined by find modules in parents (${FOO_LIBRARIES})
)
target_include_directories(${ADDON_NAME}
    PUBLIC
	$<INSTALL_INTERFACE:include/addons/${ADDON_NAME}>
	$<INSTALL_INTERFACE:include/addons/${ADDON_NAME}/SoundObjects/>
	$<INSTALL_INTERFACE:include/addons/${ADDON_NAME}/Renderers/>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/addons/${ADDON_NAME}/src/>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/addons/${ADDON_NAME}/src/SoundObjects/>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/addons/${ADDON_NAME}/src/Renderers/>
        # include directories in addon tree must be referenced like above
        # system include directories by their full path (/usr/include/foo)
)

install(TARGETS ${ADDON_NAME}
    EXPORT ${ADDON_NAME}-targets
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
)

install(DIRECTORY
	$<BUILD_INTERFACE:${openFrameworks_DIR}/addons/${ADDON_NAME}/src/>
    	DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/addons/${ADDON_NAME}/
	FILES_MATCHING PATTERN "*.h"
)

set(OFADDON_TARGETS ${OFADDON_TARGETS} ${ADDON_NAME} PARENT_SCOPE)
