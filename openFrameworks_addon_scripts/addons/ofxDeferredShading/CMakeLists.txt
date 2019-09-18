get_filename_component(ADDON_ROOT ${CMAKE_CURRENT_LIST_FILE} PATH)
get_filename_component(ADDON_NAME ${ADDON_ROOT} NAME)

message(STATUS "-------------------------------- Configuring OF Addon '${ADDON_NAME}'")

set(ADDON_SRC 
    ${ADDON_ROOT}/src/DeferredProcessor.cpp
    ${ADDON_ROOT}/src/RenderPass.cpp
    ${ADDON_ROOT}/src/pass/BloomPass.cpp
    ${ADDON_ROOT}/src/pass/BlurPass.cpp
    ${ADDON_ROOT}/src/pass/SsaoPass.cpp
    ${ADDON_ROOT}/src/pass/DofPass.cpp
    ${ADDON_ROOT}/src/pass/EdgePass.cpp
    ${ADDON_ROOT}/src/pass/PointLightPass.cpp
    ${ADDON_ROOT}/src/pass/ShadowLightPass.cpp
    ${ADDON_ROOT}/src/GBuffer.cpp
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
	$<INSTALL_INTERFACE:include/addons/${ADDON_NAME}>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/addons/${ADDON_NAME}/src/>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/addons/${ADDON_NAME}/src/pass/>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/addons/>
        # include directories in addon tree must be referenced like above
        # system include directories by their full path (/usr/include/foo)
)

install(TARGETS ${ADDON_NAME}
    EXPORT ${ADDON_NAME}-targets
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
)

install(DIRECTORY
	$<BUILD_INTERFACE:${openFrameworks_DIR}/addons/${ADDON_NAME}/src/>
	$<BUILD_INTERFACE:${openFrameworks_DIR}/addons/${ADDON_NAME}/src/pass>
    	DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/addons/${ADDON_NAME}/
	FILES_MATCHING PATTERN "*.h" PATTERN "*.hpp"
)

set(OFADDON_TARGETS ${OFADDON_TARGETS} ${ADDON_NAME} PARENT_SCOPE)
