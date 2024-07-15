find_package(SDL2 REQUIRED)

target_link_libraries(${EXE_NAME}
        ${TARGET_LIBS}
        SDL2::SDL2
)

if (BUILD_HTML)
    message(STATUS "Building .html file")
    set_target_properties(${EXE_NAME} PROPERTIES SUFFIX ".html")
endif()

target_compile_definitions(${EXE_NAME} PUBLIC -DEMSCRIPTEN=1)

set_target_properties(${EXE_NAME} PROPERTIES LINK_FLAGS "-s USE_SDL=2 -s USE_WEBGL2=1 -s FULL_ES3=1")
