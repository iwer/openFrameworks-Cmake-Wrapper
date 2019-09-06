get_filename_component(ADDON_ROOT ${CMAKE_CURRENT_LIST_FILE} PATH)
get_filename_component(ADDON_NAME ${ADDON_ROOT} NAME)

message(STATUS "-------------------------------- Configuring OF Addon '${ADDON_NAME}'")

set(ADDON_SRC 
)
set(ADDON_HDR
    ${ADDON_ROOT}/src/MSAPingPong.h
)

add_library(${ADDON_NAME}
    ${ADDON_SRC}
    ${ADDON_HDR}
)
add_library(OF::${ADDON_NAME} ALIAS ${ADDON_NAME})
add_dependencies(${ADDON_NAME} openframeworks)

target_link_libraries(${ADDON_NAME}
    openframeworks
)
target_include_directories(${ADDON_NAME}
    PUBLIC
        $<BUILD_INTERFACE:${openFrameworks_DIR}/addons/${ADDON_NAME}/src/>
)

install(TARGETS ${ADDON_NAME}
    EXPORT ${ADDON_NAME}-targets
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
)

set(OFADDON_TARGETS ${OFADDON_TARGETS} ${ADDON_NAME} PARENT_SCOPE)
