get_filename_component(ADDON_ROOT ${CMAKE_CURRENT_LIST_FILE} PATH)
get_filename_component(ADDON_NAME ${ADDON_ROOT} NAME)

message(STATUS "-------------------------------- Configuring OF Addon '${ADDON_NAME}'")

set(ADDON_SRC 
    # insert source files with ${ADDON_ROOT} as base (${ADDON_ROOT}/src/ofxAwesomeAddon.cpp)
    ${ADDON_ROOT}/src/ofxPBRShadow.cpp
    ${ADDON_ROOT}/src/ofxPBRDirectionalShadow.cpp
    ${ADDON_ROOT}/src/ofxPBROmniShadow.cpp
    ${ADDON_ROOT}/src/ofxPBRMaterial.cpp
    ${ADDON_ROOT}/src/ofxPBRCubeMap.cpp
    ${ADDON_ROOT}/src/ofxPBRLight.cpp
    ${ADDON_ROOT}/src/ofxPBR.cpp
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
)
target_include_directories(${ADDON_NAME}
    PUBLIC
        $<BUILD_INTERFACE:${openFrameworks_DIR}/addons/${ADDON_NAME}/src/>
        # include directories in addon tree must be referenced like above
        # system include directories by their full path (/usr/include/foo)
)

install(TARGETS ${ADDON_NAME}
    EXPORT ${ADDON_NAME}-targets
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
)

set(OFADDON_TARGETS ${OFADDON_TARGETS} ${ADDON_NAME} PARENT_SCOPE)
