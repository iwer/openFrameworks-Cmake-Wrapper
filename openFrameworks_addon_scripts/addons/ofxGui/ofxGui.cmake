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
#########################################################################


set(ADDONS_SOURCES ${ADDONS_SOURCES} ${ADDON_SRC})
set(ADDONS_INCLUDE_DIRS ${ADDONS_INCLUDE_DIRS} 
    $<BUILD_INTERFACE:${openFrameworks_DIR}/addons/${ADDON_NAME}/src/>)
set(ADDONS_INCLUDES ${ADDONS_INCLUDES} ${ADDON_HDR})




