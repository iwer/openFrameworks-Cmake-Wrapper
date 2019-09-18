get_filename_component(ADDON_ROOT ${CMAKE_CURRENT_LIST_FILE} PATH)
get_filename_component(ADDON_NAME ${ADDON_ROOT} NAME)

message(STATUS "-------------------------------- Configuring OF Addon '${ADDON_NAME}'")

set(ADDON_SRC 
    ${ADDON_ROOT}/libs/ofxCv/src/Calibration.cpp
    ${ADDON_ROOT}/libs/ofxCv/src/Tracker.cpp
    ${ADDON_ROOT}/libs/ofxCv/src/Distance.cpp
    ${ADDON_ROOT}/libs/ofxCv/src/Flow.cpp
    ${ADDON_ROOT}/libs/ofxCv/src/ContourFinder.cpp
    ${ADDON_ROOT}/libs/ofxCv/src/Helpers.cpp
    ${ADDON_ROOT}/libs/ofxCv/src/Wrappers.cpp
    ${ADDON_ROOT}/libs/ofxCv/src/RunningBackground.cpp
    ${ADDON_ROOT}/libs/ofxCv/src/Kalman.cpp
    ${ADDON_ROOT}/libs/ofxCv/src/Utilities.cpp
    ${ADDON_ROOT}/libs/ofxCv/src/ObjectFinder.cpp
    ${ADDON_ROOT}/libs/CLD/src/ETF.cpp
    ${ADDON_ROOT}/libs/CLD/src/fdog.cpp
)

set(ADDON_HDR
    ofxCv.h
    ObjectFinder.h
    Calibration.h
    Utilities.h
    Distance.h
    Wrappers.h
    Tracker.h
    RunningBackground.h
    Helpers.h
    Flow.h
    Kalman.h
    ContourFinder.h
    fdog.h
    ETF.h
    myvec.h
    imatrix.h
)

add_library(${ADDON_NAME}
    ${ADDON_SRC}
)
add_library(OF::${ADDON_NAME} ALIAS ${ADDON_NAME})
add_dependencies(${ADDON_NAME} openframeworks)

target_link_libraries(${ADDON_NAME}
    openframeworks
    ${OPENCV_LIBRARIES} 
    ${HARFBUZZ_LIBRARIES} 
    ${FreeType2_LIBRARIES}
)
target_include_directories(${ADDON_NAME}
    PUBLIC
	$<INSTALL_INTERFACE:include/addons/${ADDON_NAME}>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/addons/${ADDON_NAME}/src/>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/addons/${ADDON_NAME}/libs/ofxCv/include>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/addons/${ADDON_NAME}/libs/CLD/include/CLD>
)

install(TARGETS ${ADDON_NAME}
    EXPORT ${ADDON_NAME}-targets
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
)

install(DIRECTORY
	$<BUILD_INTERFACE:${openFrameworks_DIR}/addons/${ADDON_NAME}/src/>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/addons/${ADDON_NAME}/libs/ofxCv/include/>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/addons/${ADDON_NAME}/libs/CLD/include/CLD/>
    	DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/addons/${ADDON_NAME}/
	FILES_MATCHING PATTERN "*.h"
)

set(OFADDON_TARGETS ${OFADDON_TARGETS} ${ADDON_NAME} PARENT_SCOPE)

