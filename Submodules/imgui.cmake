include_directories(IMGUI_DIR ${CMAKE_CURRENT_SOURCE_DIR}/Submodules/imgui)
include_directories(${IMGUI_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/Submodules/imgui/backends)

set(IMGUI_GUI_INCLUDE
        ${CMAKE_CURRENT_SOURCE_DIR}/Submodules/imgui/imgui.cpp
        ${CMAKE_CURRENT_SOURCE_DIR}/Submodules/imgui/imgui_draw.cpp
        ${CMAKE_CURRENT_SOURCE_DIR}/Submodules/imgui/imgui_demo.cpp
        ${CMAKE_CURRENT_SOURCE_DIR}/Submodules/imgui/imgui_tables.cpp
        ${CMAKE_CURRENT_SOURCE_DIR}/Submodules/imgui/imgui_widgets.cpp
        ${CMAKE_CURRENT_SOURCE_DIR}/Submodules/imgui/backends/imgui_impl_sdl2.cpp
)

if(APPLE AND NOT EMSCRIPTEN)
    if (${VULKAN_BACKEND})
        message(STATUS "Apple Vulkan Imgui Build")
        set(IMGUI_INCLUDE
                ${IMGUI_GUI_INCLUDE}
                ${CMAKE_CURRENT_SOURCE_DIR}/Submodules/imgui/backends/imgui_impl_vulkan.cpp
        )
    elseif (${METAL_BACKEND})
        message(STATUS "Apple Metal Imgui Build")
        set(IMGUI_INCLUDE
                ${IMGUI_GUI_INCLUDE}
                ${CMAKE_CURRENT_SOURCE_DIR}/Submodules/imgui/backends/imgui_impl_metal.mm
        )

        set(APPLE_FRAMEWORKS
                "-framework Metal"
                "-framework MetalKit"
                "-framework Cocoa"
                "-framework IOKit"
                "-framework CoreVideo"
                "-framework QuartzCore"
        )
    endif ()



elseif (UNIX AND EMSCRIPTEN AND NOT APPLE )
    message(STATUS "Emscripten OpenGL Imgui Build")
    include_directories(${IMGUI_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/Submodules/imgui/examples/libs/emscripten)
    set(IMGUI_INCLUDE
            ${IMGUI_GUI_INCLUDE}
            ${CMAKE_CURRENT_SOURCE_DIR}/Submodules/imgui/backends/imgui_impl_opengl3.cpp
            ${CMAKE_CURRENT_SOURCE_DIR}/Submodules/imgui/examples/libs/emscripten/emscripten_mainloop_stub.h
    )


elseif(UNIX AND NOT EMSCRIPTEN AND NOT APPLE )
    message(STATUS "Linux Vulkan Imgui Build")
    set(IMGUI_INCLUDE
            ${IMGUI_GUI_INCLUDE}
            ${CMAKE_CURRENT_SOURCE_DIR}/Submodules/imgui/backends/imgui_impl_vulkan.cpp
    )


elseif(NOT UNIX AND NOT EMSCRIPTEN AND NOT APPLE)
    message(STATUS "Windows Vulkan Imgui Build")
    set(IMGUI_INCLUDE
            ${IMGUI_GUI_INCLUDE}
            ${CMAKE_CURRENT_SOURCE_DIR}/Submodules/imgui/backends/imgui_impl_vulkan.cpp
    )


else()
    message(FATAL_ERROR "Unsupported OS: ${CMAKE_SYSTEM_NAME}")


endif()


