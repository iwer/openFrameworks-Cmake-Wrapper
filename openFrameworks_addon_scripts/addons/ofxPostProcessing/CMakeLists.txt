get_filename_component(ADDON_ROOT ${CMAKE_CURRENT_LIST_FILE} PATH)
get_filename_component(ADDON_NAME ${ADDON_ROOT} NAME)

message(STATUS "-------------------------------- Configuring OF Addon '${ADDON_NAME}'")

set(ADDON_SRC
		${ADDON_ROOT}/src/RGBShiftPass.cpp
	  ${ADDON_ROOT}/src/LimbDarkeningPass.cpp
	  ${ADDON_ROOT}/src/BloomPass.cpp
	  ${ADDON_ROOT}/src/HorizontalTiltShifPass.cpp
	  ${ADDON_ROOT}/src/PostProcessing.cpp
	  ${ADDON_ROOT}/src/ToonPass.cpp
	  ${ADDON_ROOT}/src/VerticalTiltShifPass.cpp
	  ${ADDON_ROOT}/src/NoiseWarpPass.cpp
	  ${ADDON_ROOT}/src/SSAOPass.cpp
	  ${ADDON_ROOT}/src/GodRaysPass.cpp
	  ${ADDON_ROOT}/src/RenderPass.cpp
	  ${ADDON_ROOT}/src/HsbShiftPass.cpp
	  ${ADDON_ROOT}/src/DofPass.cpp
	  ${ADDON_ROOT}/src/PixelatePass.cpp
	  ${ADDON_ROOT}/src/EdgePass.cpp
	  ${ADDON_ROOT}/src/KaleidoscopePass.cpp
	  ${ADDON_ROOT}/src/ZoomBlurPass.cpp
	  ${ADDON_ROOT}/src/FakeSSSPass.cpp
	  ${ADDON_ROOT}/src/BleachBypassPass.cpp
	  ${ADDON_ROOT}/src/LUTPass.cpp
	  ${ADDON_ROOT}/src/ContrastPass.cpp
	  ${ADDON_ROOT}/src/DofAltPass.cpp
	  ${ADDON_ROOT}/src/ConvolutionPass.cpp
	  ${ADDON_ROOT}/src/RimHighlightingPass.cpp
	  ${ADDON_ROOT}/src/FxaaPass.cpp

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
