    set(CMAKE_EXE_LINKER_FLAGS -static)

    set_target_properties(${EXE_NAME} PROPERTIES
            CMAKE_CXX_STANDARD_REQUIRED ON
            CMAKE_INCLUDE_CURRENT_DIR  ON
            CXX_EXTENSIONS NO)
    set(CMAKE_EXE_LINKER_FLAGS -static)


    if(CMAKE_BUILD_TYPE STREQUAL "Debug")
        message(STATUS "Bundling for a debug build -- will not be portable")
        message(NOTICE "Remember to update where your Vulkan Install is, for a Release build")
        add_custom_command(TARGET ${EXE_NAME} POST_BUILD
                # This is what copies the SDL2 Frameworks over to the output binary
                COMMAND ${CMAKE_COMMAND} -E copy
                "${CMAKE_CURRENT_BINARY_DIR}/Submodules/SDL2/SDL2d.dll"
                "${CMAKE_CURRENT_BINARY_DIR}/SDL2d.dll"
        )
    elseif (NOT CMAKE_BUILD_TYPE STREQUAL "Debug")
        #Copies, relinks the frameworks file, adds folders in App bundle
        add_custom_command(TARGET ${EXE_NAME} POST_BUILD
                # This is what copies the SDL2 Frameworks over to the output binary
                COMMAND ${CMAKE_COMMAND} -E copy
                "${CMAKE_CURRENT_BINARY_DIR}/Submodules/SDL2/SDL2.dll"
                "${CMAKE_CURRENT_BINARY_DIR}/SDL2.dll"
        )
    endif ()
