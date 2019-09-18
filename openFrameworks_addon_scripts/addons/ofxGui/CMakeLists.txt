get_filename_component(ADDON_ROOT ${CMAKE_CURRENT_LIST_FILE} PATH)
get_filename_component(ADDON_NAME ${ADDON_ROOT} NAME)

message(STATUS "-------------------------------- Configuring OF Addon '${ADDON_NAME}'")

set(ADDON_SRC 
    ${ADDON_ROOT}/src/ofxBaseGui.cpp
    ${ADDON_ROOT}/src/ofxButton.cpp
    ${ADDON_ROOT}/src/ofxColorPicker.cpp
    ${ADDON_ROOT}/src/ofxGuiGroup.cpp
    ${ADDON_ROOT}/src/ofxInputField.cpp
    ${ADDON_ROOT}/src/ofxLabel.cpp
    ${ADDON_ROOT}/src/ofxPanel.cpp
    ${ADDON_ROOT}/src/ofxSlider.cpp
    ${ADDON_ROOT}/src/ofxSliderGroup.cpp
    ${ADDON_ROOT}/src/ofxToggle.cpp
)
set(ADDON_HDR
    ofxBaseGui.h
    ofxButton.h
    ofxColorPicker.h
    ofxGui.h
    ofxGuiGroup.h
    ofxInputField.h
    ofxLabel.h
    ofxSlider.h
    ofxSliderGroup.h
    ofxToggle.h)

add_library(${ADDON_NAME} 
    ${ADDON_SRC}
)
add_library(OF::${ADDON_NAME} ALIAS ${ADDON_NAME})
add_dependencies(${ADDON_NAME} openframeworks)

target_link_libraries(${ADDON_NAME} 
    openframeworks
)
target_include_directories(${ADDON_NAME}
    PUBLIC
	$<INSTALL_INTERFACE:include/addons/${ADDON_NAME}>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/addons/${ADDON_NAME}/src/>
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

