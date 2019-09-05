# This is a sample cmake file to add to newly added OF addons
# simply copy this file to addon directory and customize lib
# finding and include finding.
#
# An addon include cmake file *MUST* set the following cmake variables:
# 
# - ADDONS_SOURCES: list of addon source files
# - ADDONS_INCLUDE_DIRS: list of directories to add to addon include path
# - ADDONS_LIBRARIES: list of library the addon depend on and should be linked with
# 

get_filename_component(ADDON_ROOT ${CMAKE_CURRENT_LIST_FILE} PATH)
get_filename_component(ADDON_NAME ${ADDON_ROOT} NAME)

message(STATUS "-------------------------------- Configuring OF Addon '${ADDON_NAME}'")

#########################################################################
# Add here your cmake code to fill-in described variables
# 
# this populate ADDON_SRC with the list of source files in src/
# this should work in most cases

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

#########################################################################

set(ADDONS_SOURCES ${ADDONS_SOURCES} ${ADDON_SRC})
set(ADDONS_INCLUDE_DIRS ${ADDONS_INCLUDE_DIRS} 
    $<BUILD_INTERFACE:${openFrameworks_DIR}/addons/${ADDON_NAME}/src/>
    $<BUILD_INTERFACE:${openFrameworks_DIR}/addons/${ADDON_NAME}/libs/ofxCv/include>
    $<BUILD_INTERFACE:${openFrameworks_DIR}/addons/${ADDON_NAME}/libs/CLD/include/CLD>
)
set(ADDONS_INCLUDES ${ADDONS_INCLUDES} ${ADDON_HDR})
set(ADDONS_LIBRARIES ${ADDONS_LIBRARIES} ${OPENCV_LIBRARIES} ${HARFBUZZ_LIBRARIES} ${FreeType2_LIBRARIES})
