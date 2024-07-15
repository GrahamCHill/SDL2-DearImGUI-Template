# SpockGL

| Platform   |  Support  |
|:-----------|:---------:|
| Windows    |     ✅     |
| macOS      |     ✅     |
| Linux      |     ❌     |
| Web        |     ❌     |

## About
A Vulkan SDL project with OpenGL fallback if Vulkan is not supported

I have found if you use the CMake GUI, or CLion the build system works more consistently.

## Issues / Help

### Build Help

#### On macOS Systems
Make sure you choose "Unix Makefiles" as your chosen output with the CMake GUI, let it generate/hit the generate command 
after changing settings, then just run 
```shell
make
```
in the directory where you have chosen as your build directory.

#### On Windows Systems


#### On Linux/Unix Systems

### Credits
GLFW - https://github.com/libsdl-org/SDL   
Vulkan - https://www.vulkan.org/  
Dear ImGui - https://github.com/ocornut/imgui