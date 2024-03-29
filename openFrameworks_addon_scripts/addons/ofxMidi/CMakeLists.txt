get_filename_component(ADDON_ROOT ${CMAKE_CURRENT_LIST_FILE} PATH)
get_filename_component(ADDON_NAME ${ADDON_ROOT} NAME)

message(STATUS "-------------------------------- Configuring OF Addon '${ADDON_NAME}'")

set(ADDON_SRC 
    # insert source files with ${ADDON_ROOT} as base (${ADDON_ROOT}/src/ofxAwesomeAddon.cpp)
    ${ADDON_ROOT}/libs/rtmidi/RtMidi.cpp
    ${ADDON_ROOT}/src/ofxMidiMessage.cpp
    ${ADDON_ROOT}/src/ofxMidiIn.cpp
    ${ADDON_ROOT}/src/ofxBaseMidi.cpp
    ${ADDON_ROOT}/src/desktop/ofxRtMidiIn.cpp
    ${ADDON_ROOT}/src/desktop/ofxRtMidiOut.cpp
    ${ADDON_ROOT}/src/ofxMidiClock.cpp
    ${ADDON_ROOT}/src/ofxMidi.cpp
    ${ADDON_ROOT}/src/ofxMidiTimecode.cpp
    ${ADDON_ROOT}/src/ofxMidiOut.cpp
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
    # system libraries either by their linkname (-lfoo) 
    # or by the variable defined by find modules in parents (${FOO_LIBRARIES})
    ${ALSA_LIBRARIES}
)
target_include_directories(${ADDON_NAME}
    PUBLIC
	$<INSTALL_INTERFACE:include/addons/${ADDON_NAME}>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/addons/${ADDON_NAME}/src/>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/addons/${ADDON_NAME}/libs/rtmidi/>
        # include directories in addon tree must be referenced like above
        # system include directories by their full path (/usr/include/foo)
	${ALSA_INCLUDE_DIRS}
)

install(TARGETS ${ADDON_NAME}
    EXPORT ${ADDON_NAME}-targets
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
)

install(DIRECTORY
	$<BUILD_INTERFACE:${openFrameworks_DIR}/addons/${ADDON_NAME}/src/>
	$<BUILD_INTERFACE:${openFrameworks_DIR}/addons/${ADDON_NAME}/libs/rtmidi/>
    	DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/addons/${ADDON_NAME}/
	FILES_MATCHING PATTERN "*.h"
)

set(OFADDON_TARGETS ${OFADDON_TARGETS} ${ADDON_NAME} PARENT_SCOPE)
