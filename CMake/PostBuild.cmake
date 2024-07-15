
target_include_directories(${EXE_NAME}
        PRIVATE
        ${Vulkan_INCLUDE_DIRS})
target_link_libraries(${PROJECT_NAME}
        ${Vulkan_LIBRARIES}
        ${TARGET_LIBS}
)

# macOS build
if(APPLE AND NOT IOS)
    include(${CMAKE_CURRENT_SOURCE_DIR}/CMake/PostBuildApple.cmake)

    # Iphone/Ipad Build
elseif (IOS)
    include(${CMAKE_CURRENT_SOURCE_DIR}/CMake/PostBuildIOS.cmake)

    # Linux/Unix Build
elseif (UNIX AND NOT APPLE)
    include(${CMAKE_CURRENT_SOURCE_DIR}/CMake/PostBuildLinux.cmake)

    # Web Build
elseif (EMSCRIPTEN AND NOT APPLE)
    include(${CMAKE_CURRENT_SOURCE_DIR}/CMake/PostBuildWeb.cmake)

    # Windows Build
elseif (NOT APPLE AND NOT UNIX)
    include(${CMAKE_CURRENT_SOURCE_DIR}/CMake/PostBuildWindows.cmake)
endif ()