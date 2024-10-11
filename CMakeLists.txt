cmake_minimum_required(VERSION 3.27)
project(SDL2_DearImGUI_Template)
set(EXE_NAME ${PROJECT_NAME})
set(CMAKE_CXX_STANDARD 20)

if (${CMAKE_SYSTEM_NAME} STREQUAL "Emscripten")
    option(BUILD_HTML "Build html also!" ON)
    set(EMSCRIPTEN TRUE)
endif()

message(STATUS "Project Name: ${EXE_NAME}")

#Haven's started on the lib just yet for clever loading of Vulkan
find_package(Vulkan)

# Apple Specific Settings
if(APPLE)
    set(CMAKE_OSX_DEPLOYMENT_TARGET 10.15)
    set(CMAKE_OSX_ARCHITECTURES "arm64; x86_64") #Universal Binary

    set(CODE_SIGN FALSE)
    # Run the following command to find your Signing ID
    # security find-identity -p codesigning -v
    # Just replace the placeholder in the code below if CODE_SIGN is true
    set(SIGN_ID "Apple Development: your-email@email.com \\(j3rgt32tfs\\)")
    # Currently it requires SDL installed in the frameworks folder
    # but only for Code completion and to let the IDE know about SDL2
#    find_package(SDL2)
    include_directories(${SDL2_INCLUDE_DIRS})
    # Found in $ENV{HOME}/VulkanSDK/${VULKANVERSION}/macOS/lib/
    set(VULKAN_LIB "libvulkan.1.3.283.dylib")
    set(VULKANVERSION 1.3.283.0)


    set(SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/Resources")
    set(DESTINATION_DIR "${CMAKE_CURRENT_BINARY_DIR}/${EXE_NAME}.app/Contents/Resources")


    # Linux Specific Settings
elseif (NOT APPLE AND UNIX)


    # Windows Specific Settings
elseif (NOT APPLE AND NOT UNIX)
    set(SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/Resources")
    set(DESTINATION_DIR "${CMAKE_CURRENT_BINARY_DIR}/../Resources")
endif()

# The pattern for copying files to the resources directory
set(SOURCE_PATTERN "*.*")


include(${CMAKE_CURRENT_SOURCE_DIR}/Submodules/CMakeLists.txt)

include(${CMAKE_CURRENT_SOURCE_DIR}/CMake/Platform.cmake)

add_executable(${EXE_NAME}
#        WIN32
        MACOSX_BUNDLE
        src/main.cpp
        ${SUBMODULE_INCLUDE})

set(TARGET_LIBS SDL2)

include(${CMAKE_CURRENT_SOURCE_DIR}/CMake/PostBuild.cmake)




