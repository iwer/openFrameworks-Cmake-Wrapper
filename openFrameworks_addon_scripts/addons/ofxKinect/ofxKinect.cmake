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
    ${ADDON_ROOT}/src/ofxKinect.cpp
    ${ADDON_ROOT}/src/extra/ofxKinectExtras.cpp
    ${ADDON_ROOT}/libs/libfreenect/src/audio.c
    ${ADDON_ROOT}/libs/libfreenect/src/cameras.c
    ${ADDON_ROOT}/libs/libfreenect/src/core.c
    ${ADDON_ROOT}/libs/libfreenect/src/flags.c
    ${ADDON_ROOT}/libs/libfreenect/src/loader.c
    ${ADDON_ROOT}/libs/libfreenect/src/registration.c
    ${ADDON_ROOT}/libs/libfreenect/src/tilt.c
    ${ADDON_ROOT}/libs/libfreenect/src/usb_libusb10.c
)
set(ADDON_HDR
    ofxKinect.h
    ofxBase3DVideo.h
    ofxKinectExtras.h
    cameras.h
    flags.h
    freenect_internal.h
    loader.h
    registration.h
    usb_libusb10.h
    ofxToggle.h
    libfreenect.h
    libfreenect_audio.h
    libfreenect_registration.h
)
#########################################################################


set(ADDONS_SOURCES ${ADDONS_SOURCES} ${ADDON_SRC})
set(ADDONS_INCLUDE_DIRS ${ADDONS_INCLUDE_DIRS} 
    $<BUILD_INTERFACE:${openFrameworks_DIR}/addons/${ADDON_NAME}/src>
    $<BUILD_INTERFACE:${openFrameworks_DIR}/addons/${ADDON_NAME}/src/extra>
    $<BUILD_INTERFACE:${openFrameworks_DIR}/addons/${ADDON_NAME}/libs/libfreenect/include>
    $<BUILD_INTERFACE:${openFrameworks_DIR}/addons/${ADDON_NAME}/libs/libfreenect/src>
    /usr/include/libusb-1.0
)
set(ADDONS_INCLUDES ${ADDONS_INCLUDES} ${ADDON_HDR})

set(ADDONS_LIBRARIES ${ADDONS_LIBRARIES} usb-1.0)


