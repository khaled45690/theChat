
# For more information about using CMake with Android Studio, read the
# documentation: https://d.android.com/studio/projects/add-native-code.html

# Sets the minimum version of CMake required to build the native library.

cmake_minimum_required(VERSION 3.18.1)

# Declares and names the project.

project("main")
project("opencv")
project("yuv")

SET(OpenCV_STATIC on)
SET(OpenCV_DIR C:/Users/khaled/Downloads/opencv-4.6.0-android-sdk/OpenCV-android-sdk/sdk/native/jni)
find_package(OpenCV REQUIRED)
# Creates and names a library, sets it as either STATIC
# or SHARED, and provides the relative paths to its source code.
# You can define multiple libraries, and CMake builds them for you.
# Gradle automatically packages shared libraries with your APK.
#target_link_libraries(F:/programing/AndroidStudio/Flutter/flutter_windows_2.5.3-stable/flutter/bin/cache/dart-sdk/bin/dart.so)

SET(YUV_STATIC on)
SET(YUV_DIR F:/programs/YUV/libyuv/src)
find_package(YUV REQUIRED)


add_library( # Sets the name of the library.
        main

             # Sets the library as a shared library.
             SHARED

             # Provides a relative path to your source file(s).
        main.cpp
        src/CppFiles/CameraEngine.cpp
        src/CppFiles/ImageListenerYUV.cpp
        src/CppFiles/ImageListenerJPEG.cpp
        src/CppFiles/DartNotifyHandler.cpp
        src/yuv/source/convert_argb.cc
        F:/programing/AndroidStudio/Flutter/flutter_windows_2.5.3-stable/flutter/bin/cache/dart-sdk/include/dart_api_dl.c
        F:/programing/AndroidStudio/Flutter/flutter_windows_2.5.3-stable/flutter/bin/cache/dart-sdk/bin/dart.lib
        )

add_subdirectory(F:/programs/YUV/libyuv/src/CMakeLists.txt)

target_include_directories(main PUBLIC F:/programs/YUV/libyuv/src/include)
target_link_directories(main PUBLIC F:/programs/YUV/libyuv/src)

#set_target_properties(lib_opencv PROPERTIES IMPORTED_LOCATION ${CMAKE_CURRENT_SOURCE_DIR}/src/main/jniLibs/${ANDROID_ABI}/libopencv_java3.so)

# Searches for a specified prebuilt library and stores the path as a
# variable. Because CMake includes system libraries in the search path by
# default, you only need to specify the name of the public NDK library
# you want to add. CMake verifies that the library exists before
# completing its build.




find_library( # Sets the name of the path variable.
              log-lib

              # Specifies the name of the NDK library that
              # you want CMake to locate.
              log )

# Specifies libraries CMake should link to your target library. You
# can link multiple libraries, such as libraries you define in this
# build script, prebuilt third-party libraries, or system libraries.

target_link_libraries( # Specifies the target library.
                        main
                       # Links the target library to the log library
                       # included in the NDK.
                        camera2ndk
                        android
                        mediandk
                        yuv
                        ${OpenCV_LIBS}
                        ${YUV_LIBS}
                       ${log-lib} )