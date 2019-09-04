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
    ${ADDON_ROOT}/src/ofxCvColorImage.cpp
    ${ADDON_ROOT}/src/ofxCvContourFinder.cpp
    ${ADDON_ROOT}/src/ofxCvFloatImage.cpp
    ${ADDON_ROOT}/src/ofxCvGrayscaleImage.cpp
    ${ADDON_ROOT}/src/ofxCvHaarFinder.cpp
    ${ADDON_ROOT}/src/ofxCvImage.cpp
    ${ADDON_ROOT}/src/ofxCvShortImage.cpp
)

set(ADDON_HDR
    ofxCvBlob.h
    ofxCvColorImage.h
    ofxCvConstants.h
    ofxCvContourFinder.h
    ofxCvFloatImage.h
    ofxCvGrayscaleImage.h
    ofxCvHaarFinder.h
    ofxCvImage.h
    ofxCvShortImage.h
)
#########################################################################


set(ADDONS_SOURCES ${ADDONS_SOURCES} ${ADDON_SRC})
set(ADDONS_INCLUDE_DIRS ${ADDONS_INCLUDE_DIRS} 
    $<BUILD_INTERFACE:${openFrameworks_DIR}/addons/${ADDON_NAME}/src/>
    /usr/include/opencv 
    /usr/include/harfbuzz 
    /usr/include/freetype2
    /usr/include/libpng16
    /usr/include/glib-2.0 
    /usr/lib/x86_64-linux-gnu/glib-2.0/include
)
set(ADDONS_INCLUDES ${ADDONS_INCLUDES} ${ADDON_HDR})
set(ADDONS_LIBRARIES ${ADDONS_LIBRARIES} ${OPENCV_LIBRARIES} ${HARFBUZZ_LIBRARIES} ${FreeType2_LIBRARIES})




