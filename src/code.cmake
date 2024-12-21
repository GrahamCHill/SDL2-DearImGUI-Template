include(${CMAKE_CURRENT_SOURCE_DIR}/src/SignalSlots/SignalSlots.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/src/settings.cmake)
# Handling main for metal/objective-cpp and regular cpp
if (APPLE AND NOT EMSCRIPTEN)
    if (NOT VULKAN_BACKEND)
        set(ENTRY_POINT ${CMAKE_CURRENT_SOURCE_DIR}/Src/main.mm)
    elseif (VULKAN_BACKEND)
        set(ENTRY_POINT ${CMAKE_CURRENT_SOURCE_DIR}/Src/main.cpp)
    endif ()
else ()
    set(ENTRY_POINT ${CMAKE_CURRENT_SOURCE_DIR}/Src/main.cpp)
endif ()


# Add your code files here
set(APP_CODE
)
