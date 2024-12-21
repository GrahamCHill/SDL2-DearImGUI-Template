cmake_minimum_required(VERSION 3.27)
project(SDL2_DearImGUI_Template)
set(EXE_NAME ${PROJECT_NAME})
set(CMAKE_CXX_STANDARD 20)

if (${CMAKE_SYSTEM_NAME} STREQUAL "Emscripten")
    option(BUILD_HTML "Build html also!" ON)
    set(EMSCRIPTEN TRUE)
endif()

message(STATUS "Project Name: ${EXE_NAME}")

include(${CMAKE_CURRENT_SOURCE_DIR}/src/code.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/CMake/SettingsRenderer.cmake)

find_package(Vulkan)

include(${CMAKE_CURRENT_SOURCE_DIR}/Submodules/CMakeLists.txt)

include(${CMAKE_CURRENT_SOURCE_DIR}/CMake/Platform.cmake)

add_executable(${EXE_NAME}
#        WIN32
        MACOSX_BUNDLE
        ${ENTRY_POINT}
        ${APP_CODE}
        ${SUBMODULE_INCLUDE})

set(TARGET_LIBS SDL2)

include(${CMAKE_CURRENT_SOURCE_DIR}/CMake/PostBuild.cmake)




