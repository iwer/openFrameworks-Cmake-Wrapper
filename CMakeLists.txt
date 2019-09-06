cmake_minimum_required(VERSION 3.2 FATAL_ERROR)
project(openFrameworks VERSION 0.10.1 LANGUAGES C CXX)

# Make sure custom modules are found
set(CUSTOM_MODULE_PATH "/home/elresidente/Develop/Repository/CMakeHelpers")
list(APPEND CMAKE_MODULE_PATH "${CUSTOM_MODULE_PATH}")

set(openFrameworks_DIR "/home/elresidente/Develop/Repository/openFrameworks-dev/openFrameworks")

#######################
# Declare dependencies
set(OpenGL_GL_PREFERENCE GLVND)
find_package(OpenGL REQUIRED)
find_package(GLUT REQUIRED)
find_package(X11 REQUIRED COMPONENTS X11 Xrandr Xxf86vm Xi Xcursor Xinerama)
find_package(Threads REQUIRED)
find_package(FreeImage REQUIRED)
# find_package(stdc++fs REQUIRED) for c++17 std::filesystem
find_package(Boost REQUIRED COMPONENTS system filesystem)
find_package(PugiXML REQUIRED)
find_package(assimp)
find_package(OpenCL)

include(FindPkgConfig)
pkg_search_module(Cairo REQUIRED cairo)
pkg_search_module(ZLIB REQUIRED zlib)
pkg_search_module(GST REQUIRED gstreamer-1.0)
pkg_search_module(GSTAPP REQUIRED gstreamer-app-1.0)
pkg_search_module(GSTVID REQUIRED gstreamer-video-1.0)
pkg_search_module(GSTBASE REQUIRED gstreamer-base-1.0)
pkg_search_module(UDEV REQUIRED libudev)
pkg_search_module(FreeType2 REQUIRED freetype2)
pkg_search_module(FontConfig REQUIRED fontconfig)
pkg_search_module(Sndfile REQUIRED sndfile)
pkg_search_module(OpenAL REQUIRED openal)
pkg_search_module(Curl REQUIRED libcurl)
pkg_search_module(GLFW3 REQUIRED glfw3)
pkg_search_module(RtAudio REQUIRED rtaudio)
pkg_search_module(Pulse REQUIRED libpulse-simple)
pkg_search_module(ALSA REQUIRED alsa)
pkg_search_module(GL REQUIRED gl)
pkg_search_module(GLu REQUIRED glu)
pkg_search_module(GLEW REQUIRED glew)
pkg_search_module(GTK REQUIRED gtk+-3.0)
pkg_search_module(MPG123 REQUIRED libmpg123)
pkg_search_module(GTK REQUIRED gstreamer-gl-1.0)
pkg_search_module(URI REQUIRED liburiparser)
pkg_search_module(USB libusb-1.0)
pkg_search_module(OPENCV opencv)
pkg_search_module(HARFBUZZ harfbuzz)

#######################
# Create target and set properties

add_library(openframeworks
        ${openFrameworks_DIR}/libs/openFrameworks/3d/of3dPrimitives.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/3d/of3dUtils.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/3d/ofCamera.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/3d/ofEasyCam.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/3d/ofMesh.inl
        ${openFrameworks_DIR}/libs/openFrameworks/3d/ofNode.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/app/ofAppGLFWWindow.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/app/ofAppGlutWindow.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/app/ofAppNoWindow.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/app/ofAppRunner.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/app/ofBaseApp.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/app/ofMainLoop.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/communication/ofArduino.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/communication/ofSerial.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/events/ofEvents.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/gl/ofBufferObject.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/gl/ofFbo.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/gl/ofGLProgrammableRenderer.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/gl/ofGLRenderer.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/gl/ofGLUtils.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/gl/ofLight.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/gl/ofMaterial.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/gl/ofShader.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/gl/ofTexture.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/gl/ofVbo.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/gl/ofVboMesh.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/graphics/of3dGraphics.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/graphics/ofBitmapFont.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/graphics/ofCairoRenderer.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/graphics/ofGraphics.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/graphics/ofGraphicsBaseTypes.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/graphics/ofImage.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/graphics/ofPath.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/graphics/ofPixels.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/graphics/ofPolyline.inl
        ${openFrameworks_DIR}/libs/openFrameworks/graphics/ofRendererCollection.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/graphics/ofTessellator.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/graphics/ofTrueTypeFont.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/math/ofMath.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/math/ofMatrix3x3.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/math/ofMatrix4x4.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/math/ofQuaternion.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/math/ofVec2f.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/math/ofVec4f.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/sound/ofFmodSoundPlayer.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/sound/ofOpenALSoundPlayer.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/sound/ofRtAudioSoundStream.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/sound/ofSoundBaseTypes.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/sound/ofSoundBuffer.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/sound/ofSoundPlayer.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/sound/ofSoundStream.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/types/ofBaseTypes.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/types/ofColor.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/types/ofParameter.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/types/ofParameterGroup.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/types/ofRectangle.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/utils/ofFileUtils.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/utils/ofFpsCounter.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/utils/ofLog.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/utils/ofMatrixStack.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/utils/ofSystemUtils.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/utils/ofThread.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/utils/ofTimer.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/utils/ofURLFileLoader.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/utils/ofUtils.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/utils/ofXml.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/video/ofVideoGrabber.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/video/ofVideoPlayer.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/video/ofGstUtils.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/video/ofGstVideoGrabber.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/video/ofGstVideoPlayer.cpp
)

#######################
# add alias so that lib can be used inside build tree, e.g. when testing
add_library(OF::openframeworks ALIAS openframeworks)

#######################
# set target properties
target_include_directories(openframeworks
    PUBLIC
        $<INSTALL_INTERFACE:include>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/libs/openFrameworks>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/libs/openFrameworks/graphics>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/libs/openFrameworks/3d>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/libs/openFrameworks/math>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/libs/openFrameworks/gl>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/libs/openFrameworks/video>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/libs/openFrameworks/types>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/libs/openFrameworks/sound>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/libs/openFrameworks/app>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/libs/openFrameworks/events>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/libs/openFrameworks/communication>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/libs/openFrameworks/utils>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/libs/tess2/include>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/libs/utf8/include>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/libs/glm/include>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/libs/json/include>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/libs/kiss/include>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/libs/fmodex/include>
        ${GST_INCLUDE_DIRS} 
        ${GSTAPP_INCLUDE_DIRS} 
        ${GSTVID_INCLUDE_DIRS} 
        ${GSTBASE_INCLUDE_DIRS}
        ${Cairo_INCLUDE_DIRS}
        ${RtAudio_INCLUDE_DIRS}
)

#######################

target_compile_features(openframeworks PRIVATE cxx_auto_type)

#######################

target_compile_definitions(openframeworks PUBLIC GLM_ENABLE_EXPERIMENTAL)

#######################

target_link_libraries(openframeworks
    PUBLIC
	${GLUT_LIBRARIES}
	${GLEW_LIBRARIES}
	${X11_LIBRARIES}
	${FREEIMAGE_LIBRARIES}
	${URI_LIBRARIES}
	$<BUILD_INTERFACE:${openFrameworks_DIR}/libs/tess2/lib/linux64/libtess2.a>
	${FreeType2_LIBRARIES}
	${FontConfig_LIBRARIES}
	${Curl_LIBRARIES}
	${GST_LIBRARIES}
	${GSTAPP_LIBRARIES} 
	${GSTVID_LIBRARIES} 
	${GSTBASE_LIBRARIES}
	${GLFW3_LIBRARIES}
	${Cairo_LIBRARIES}
	${OpenAL_LIBRARIES}
	${Sndfile_LIBRARIES}
	$<BUILD_INTERFACE:${openFrameworks_DIR}/libs/kiss/lib/linux64/libkiss.a>
	${PUGIXML_LIBRARIES}
    Boost::filesystem
    ${CMAKE_DL_LIBS} 
    ${CMAKE_THREAD_LIBS_INIT}
    PRIVATE
)


add_subdirectory(${openFrameworks_DIR}/addons/ofxGui)
add_subdirectory(${openFrameworks_DIR}/addons/ofxXmlSettings)
add_subdirectory(${openFrameworks_DIR}/addons/ofxThreadedImageLoader)
add_subdirectory(${openFrameworks_DIR}/addons/ofxAutoReloadedShader)
add_subdirectory(${openFrameworks_DIR}/addons/ofxOsc)
add_subdirectory(${openFrameworks_DIR}/addons/ofxMSAPingPong)
if(${assimp_FOUND})
    add_subdirectory(${openFrameworks_DIR}/addons/ofxAssimpModelLoader)
endif(${assimp_FOUND})
if(${USB_FOUND})
    add_subdirectory(${openFrameworks_DIR}/addons/ofxKinect)
endif(${USB_FOUND})
if(${OpenCL_FOUND})
    add_subdirectory(${openFrameworks_DIR}/addons/ofxMSAOpenCL)
endif(${OpenCL_FOUND})
if(${OPENCV_FOUND} AND ${HARFBUZZ_FOUND} AND ${FreeType2_FOUND})
    add_subdirectory(${openFrameworks_DIR}/addons/ofxOpenCv)
    add_subdirectory(${openFrameworks_DIR}/addons/ofxCv)
endif(${OPENCV_FOUND} AND ${HARFBUZZ_FOUND} AND ${FreeType2_FOUND})

#######################
# Installation instructions
include(GNUInstallDirs)
set(INSTALL_CONFIGDIR ${CMAKE_INSTALL_LIBDIR}/cmake/openFrameworks)

install(TARGETS openframeworks
    EXPORT openframeworks-targets
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
)
install(TARGETS ${OFADDON_TARGETS}
    EXPORT ofaddons-targets
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
)

# this is required so that the exported target has the name openFrameworks and not openframeworks
set_target_properties(openframeworks PROPERTIES EXPORT_NAME openFrameworks)

install(DIRECTORY
        $<BUILD_INTERFACE:${openFrameworks_DIR}/libs/openFrameworks/>
    DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
    FILES_MATCHING PATTERN "*.h"
    PATTERN "graphics/" EXCLUDE
    PATTERN "3d/" EXCLUDE
    PATTERN "math/" EXCLUDE
    PATTERN "gl/" EXCLUDE
    PATTERN "video/" EXCLUDE
    PATTERN "types/" EXCLUDE
    PATTERN "sound/" EXCLUDE
    PATTERN "app/" EXCLUDE
    PATTERN "events/" EXCLUDE
    PATTERN "communiction/" EXCLUDE
    PATTERN "graphics/" EXCLUDE
    PATTERN "utils/" EXCLUDE
)


install(DIRECTORY
        $<BUILD_INTERFACE:${openFrameworks_DIR}/libs/openFrameworks/graphics/>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/libs/openFrameworks/3d/>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/libs/openFrameworks/math/>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/libs/openFrameworks/gl/>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/libs/openFrameworks/video/>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/libs/openFrameworks/types/>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/libs/openFrameworks/sound/>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/libs/openFrameworks/app/>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/libs/openFrameworks/events/>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/libs/openFrameworks/communication/>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/libs/openFrameworks/utils/>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/libs/tess2/include/>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/libs/utf8/include/>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/libs/glm/include/>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/libs/json/include/>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/libs/kiss/include/>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/libs/fmodex/include/>
        ${ADDONS_INCLUDE_DIRS}
    DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
    FILES_MATCHING PATTERN "*.h" PATTERN "*.inl"
)

# export targets to a script
install(EXPORT openframeworks-targets
    FILE
        openFrameworksTargets.cmake
    NAMESPACE
        OF::
    DESTINATION
        ${INSTALL_CONFIGDIR}
)

# Create a ConfigVersion.cmake file
include(CMakePackageConfigHelpers)
write_basic_package_version_file(
    ${CMAKE_CURRENT_BINARY_DIR}/openFrameworksConfigVersion.cmake
    VERSION ${PROJECT_VERSION}
    COMPATIBILITY AnyNewerVersion
)

configure_package_config_file(${CMAKE_CURRENT_LIST_DIR}/cmake/openFrameworksConfig.cmake.in
    ${CMAKE_CURRENT_BINARY_DIR}/openFrameworksConfig.cmake
    INSTALL_DESTINATION ${INSTALL_CONFIGDIR}
)

# install config, configversion and custom find module
install(FILES
#    ${CMAKE_CURRENT_LIST_DIR}/cmake/FindopenFrameworks.cmake
    ${CMAKE_CURRENT_BINARY_DIR}/openFrameworksConfig.cmake
    ${CMAKE_CURRENT_BINARY_DIR}/openFrameworksConfigVersion.cmake
    DESTINATION ${INSTALL_CONFIGDIR}
)

export(
    TARGETS 
        openframeworks
        ${OFADDON_TARGETS} 
    FILE 
        ${CMAKE_CURRENT_BINARY_DIR}/openFrameworksTargets.cmake 
    NAMESPACE 
        OF::
)

# register package
export(PACKAGE openFrameworks)
