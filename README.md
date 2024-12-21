# SDL2 Dear ImGui Vulkan Template (CMake)  

A template that uses Vulkan on Windows and MoltenVK on macOS that allows setting of application icon by the developer with convenience files.  
This is a relativly simple template file allowing you to develop from ocornut's [Dear ImGui](https://github.com/ocornut/imgui) SDL2+Vulkan template.  
If you would rather use GLFW and Dear ImGUI, you can use the sister template I have created here [GLFW variant](https://github.com/GrahamCHill/GLFW-DearImGui-Vulkan-Template)  

I will consider supporting alternative platforms at a later date, but for now all desktop platforms are supported through 
Vulkan (or MoltenVk,) this is ideal if you are wanting a simple solution to a Dear ImGui project that can be used on all 
platforms.

| Platform   |  Support  |
|:-----------|:---------:|
| Windows    |     ✅     |
| macOS      |     ✅     |
| Linux      |     ✅     |


### Build Help

#### On Linux Distros Systems

Assuming all required dependencies for working with C++ and CMake are available on 
your system the build should just work, but it will not be portable to other distros in the
current state.

You can see this as the SDL2 library is using an absolute path to the library output.
If you want to see this go to the build output and run the below command
```shell
ldd SDL2_DearImGUI_Template
```
patchelf to change the library link path.   
There is an option in the cmake file for Linux distros that will perform this if you would like to use it
(if you want to add other libraries to this system just go the linux postbuild CMake file.)  

#### On macOS Systems

It should work with very few customisations on macOS, if you have the MoltenVK libraries installed.  
You will have to update the following lines in the CMakeLists.txt:

````Cmake
    set(VULKAN_LIB "libvulkan.1.3.283.dylib")
    set(VULKAN_VERSION 1.3.283.0)
````

You will alter the version numbers to match your MoltenVK version, and then it should build and create a fully portable binary.

#### On Windows Systems

I have found there is a bug with Vulkan on AMD laptops with Nvidia GPU's, if you are running one then follow the fixes present here:

- https://nvidia.custhelp.com/app/answers/detail/a_id/5182/~/unable-to-launch-vulkan-apps%2Fgame-on-notebooks-with-amd-radeon-igpus

This should make it functional on Windows Laptops with AMD CPU's and Nvidia GPU's if you had issues.

### Known Issues
- The file that allows saving of custom window positioning doesn't always seem to work.


### Credits
SDL2 - https://github.com/libsdl-org/SDL   
Vulkan - https://www.vulkan.org/  
Dear ImGui - https://github.com/ocornut/imgui
