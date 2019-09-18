get_filename_component(ADDON_ROOT ${CMAKE_CURRENT_LIST_FILE} PATH)
get_filename_component(ADDON_NAME ${ADDON_ROOT} NAME)

message(STATUS "-------------------------------- Configuring OF Addon '${ADDON_NAME}'")

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
        /usr/include/opencv
        /usr/include/harfbuzz
        /usr/include/freetype2
        /usr/include/libpng16
        /usr/include/glib-2.0
        /usr/lib/x86_64-linux-gnu/glib-2.0/include
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


