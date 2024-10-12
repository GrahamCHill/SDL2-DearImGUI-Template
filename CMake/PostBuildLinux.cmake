 if(CMAKE_BUILD_TYPE STREQUAL "Debug")
     message(STATUS "Bundling for a debug build -- will not be portable")
 elseif (NOT CMAKE_BUILD_TYPE STREQUAL "Debug")
     if(EASY_PORTABLE)

         add_custom_command(TARGET ${EXE_NAME} POST_BUILD
                 COMMAND ${CMAKE_COMMAND} -E make_directory
                 "${CMAKE_CURRENT_BINARY_DIR}/libs"
                 # Copying Files, The library will link to these
                 COMMAND ${CMAKE_COMMAND} -E copy
                 "${CMAKE_CURRENT_BINARY_DIR}/Submodules/SDL2/libSDL2-2.0.so*"
                 "${CMAKE_CURRENT_BINARY_DIR}/libs/"

                 COMMAND patchelf --set-rpath
                 "./libs/"
                 SDL2_DearImGUI_Template
         )
          endif ()
 endif ()