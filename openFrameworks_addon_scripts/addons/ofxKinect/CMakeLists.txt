get_filename_component(ADDON_ROOT ${CMAKE_CURRENT_LIST_FILE} PATH)
get_filename_component(ADDON_NAME ${ADDON_ROOT} NAME)

message(STATUS "-------------------------------- Configuring OF Addon '${ADDON_NAME}'")

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

add_library(${ADDON_NAME}
    ${ADDON_SRC}
)
add_library(OF::${ADDON_NAME} ALIAS ${ADDON_NAME})
add_dependencies(${ADDON_NAME} openframeworks)

target_link_libraries(${ADDON_NAME}
    openframeworks
    usb-1.0
)
target_include_directories(${ADDON_NAME}
    PUBLIC
        $<BUILD_INTERFACE:${openFrameworks_DIR}/addons/${ADDON_NAME}/src/>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/addons/${ADDON_NAME}/src/extra>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/addons/${ADDON_NAME}/libs/libfreenect/include>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/addons/${ADDON_NAME}/libs/libfreenect/src>
        /usr/include/libusb-1.0
)

install(TARGETS ${ADDON_NAME}
    EXPORT ${ADDON_NAME}-targets
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
)

set(OFADDON_TARGETS ${OFADDON_TARGETS} ${ADDON_NAME} PARENT_SCOPE)

