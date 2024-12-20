set(VULKAN_BACKEND true)
# Apple Settings
if (APPLE AND NOT EMSCRIPTEN)
    if (NOT VULKAN_BACKEND)
        set(METAL_BACKEND true)
    endif ()

# Web Settings
elseif (UNIX AND EMSCRIPTEN AND NOT APPLE)

# GnuLinux/Unix Settings
elseif(UNIX AND NOT EMSCRIPTEN AND NOT APPLE)
    if (NOT VULKAN_BACKEND)
        set(OPEN_GL_BACKEND true)
    endif ()

# Windows Settings
elseif(NOT UNIX AND NOT EMSCRIPTEN AND NOT APPLE)
    if (NOT VULKAN_BACKEND)
        set(DX_BACKEND true)
    endif ()
endif ()