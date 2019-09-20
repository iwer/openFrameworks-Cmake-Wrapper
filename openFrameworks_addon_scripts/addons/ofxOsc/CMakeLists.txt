get_filename_component(ADDON_ROOT ${CMAKE_CURRENT_LIST_FILE} PATH)
get_filename_component(ADDON_NAME ${ADDON_ROOT} NAME)

message(STATUS "-------------------------------- Configuring OF Addon '${ADDON_NAME}'")

if(WIN32)
    SET(PLATFORM "win32")
else()
    SET(PLATFORM "posix")
endif(WIN32)

file( GLOB_RECURSE ADDON_SRC ${ADDON_ROOT}/src/*.cpp)
SET(ADDON_SRC 
	${ADDON_SRC}
	"${ADDON_ROOT}/libs/oscpack/src/ip/IpEndpointName.cpp"
	"${ADDON_ROOT}/libs/oscpack/src/ip/${PLATFORM}/NetworkingUtils.cpp"
	"${ADDON_ROOT}/libs/oscpack/src/ip/${PLATFORM}/UdpSocket.cpp"
	"${ADDON_ROOT}/libs/oscpack/src/osc/OscOutboundPacketStream.cpp"
	"${ADDON_ROOT}/libs/oscpack/src/osc/OscPrintReceivedElements.cpp"
	"${ADDON_ROOT}/libs/oscpack/src/osc/OscReceivedElements.cpp"
	"${ADDON_ROOT}/libs/oscpack/src/osc/OscTypes.cpp"
	)

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
	$<INSTALL_INTERFACE:include/addons/${ADDON_NAME}/osc/>
	$<INSTALL_INTERFACE:include/addons/${ADDON_NAME}/ip/>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/addons/${ADDON_NAME}/src/>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/addons/${ADDON_NAME}/libs/oscpack/src/>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/addons/${ADDON_NAME}/libs/oscpack/src/osc/>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/addons/${ADDON_NAME}/libs/oscpack/src/ip/>
)

install(TARGETS ${ADDON_NAME}
    EXPORT ${ADDON_NAME}-targets
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
)

install(DIRECTORY
	$<BUILD_INTERFACE:${openFrameworks_DIR}/addons/${ADDON_NAME}/src/>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/addons/${ADDON_NAME}/libs/oscpack/src/>
#        $<BUILD_INTERFACE:${openFrameworks_DIR}/addons/${ADDON_NAME}/libs/oscpack/src/osc/>
#        $<BUILD_INTERFACE:${openFrameworks_DIR}/addons/${ADDON_NAME}/libs/oscpack/src/ip/>
    	DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/addons/${ADDON_NAME}/
	FILES_MATCHING PATTERN "*.h"
)

set(OFADDON_TARGETS ${OFADDON_TARGETS} ${ADDON_NAME} PARENT_SCOPE)


