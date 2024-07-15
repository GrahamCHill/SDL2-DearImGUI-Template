# macOS build
if(APPLE AND NOT IOS)
    include(${CMAKE_CURRENT_SOURCE_DIR}/CMake/PlatformApple.cmake)

# Iphone/Ipad Build
elseif (IOS)
    include(${CMAKE_CURRENT_SOURCE_DIR}/CMake/PlatformIOS.cmake)

# Linux/Unix Build
elseif (UNIX AND NOT APPLE)
    include(${CMAKE_CURRENT_SOURCE_DIR}/CMake/PlatformLinux.cmake)

# Web Build
elseif (EMSCRIPTEN AND NOT APPLE)
    include(${CMAKE_CURRENT_SOURCE_DIR}/CMake/PlatformWeb.cmake)

# Windows Build
elseif (NOT APPLE AND NOT UNIX)
    include(${CMAKE_CURRENT_SOURCE_DIR}/CMake/PlatformWindows.cmake)
endif ()