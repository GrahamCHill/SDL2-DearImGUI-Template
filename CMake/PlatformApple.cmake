message(STATUS "Include Working")

message(STATUS "minOS supported version: ${CMAKE_OSX_DEPLOYMENT_TARGET}")

if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    message(STATUS "Bundling for a debug build -- will not be portable")
    message(NOTICE "Remember to update where your Vulkan Install is, for a Release build")


else()
    message(STATUS "Bundling for a release build -- should be portable")

    set(MACOSX_BUNDLE_ICON_FILE "${MAC_APP_IMAGE}")

    set_source_files_properties(
            # place resources here like this:
            # "${RESOURCES_DIR}/cute_image.jpg"
            "${ICONS_DIR}/${MAC_APP_IMAGE}"
            PROPERTIES
            MACOSX_PACKAGE_LOCATION "Resources"
    )
    set(APP_ICON "${ICONS_DIR}/${MAC_APP_IMAGE}")

    # Holdover from old test version, it still works and forces dev to update settings for the release build
    include_directories(VULKAN_MACOS_INCLUDE
            $ENV{HOME}/VulkanSDK/${VULKAN_VERSION}/macOS/include)
    set(VULKAN_MACOS_LIBS
            $ENV{HOME}/VulkanSDK/${VULKAN_VERSION}/macOS/lib/${VULKAN_LIB}
    )

endif()




