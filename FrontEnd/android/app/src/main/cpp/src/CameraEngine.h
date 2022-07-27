//
// Created by khaled on 7/3/2022.
//

#include <camera/NdkCameraManager.h>
#include <media/NdkImageReader.h>
#include <functional>
#include "F:/programing/AndroidStudio/Flutter/flutter_windows_2.5.3-stable/flutter/bin/cache/dart-sdk/include/dart_api.h"
#include "F:/programing/AndroidStudio/Flutter/flutter_windows_2.5.3-stable/flutter/bin/cache/dart-sdk/include/dart_native_api.h"
#include "F:/programing/AndroidStudio/Flutter/flutter_windows_2.5.3-stable/flutter/bin/cache/dart-sdk/include/dart_api_dl.h"
#include "F:/programing/AndroidStudio/Flutter/flutter_windows_2.5.3-stable/flutter/bin/cache/dart-sdk/include/dart_version.h"
typedef std::function<void()> Work;


//#ifndef ANDROID_CAMERAENGINE_H
//#define ANDROID_CAMERAENGINE_H

class CameraEngine{
private:
    ACameraManager *manager;
    ACameraDevice *device;
    ACaptureSessionOutputContainer *container;
    ACameraIdList *cameraIdList;
    AImageReader *reader;
    ANativeWindow *AImageNativeWindow;
    ACameraOutputTarget *targetOutput1;
    ACaptureSessionOutput *output;
    ACaptureRequest *request;
    ACameraCaptureSession *session;
    static int64_t dartSendPort;
    static void (*dartCallback)(uint8_t* , int64_t , int64_t);
    static void onImageAvailableYUVtoRGB(void* context, AImageReader* reader);
    static void onImageAvailableJPEG(void* context, AImageReader* reader);
    static void NotifyDart(uint8_t* , int64_t , int64_t);
    static int clamp(int i);
public:
    // initialize function is used to initialize the variables data
    // and then start the camera and start the image streaming process
    // and get back the images in uint32_t format
    int initialize(void (*callback)(uint8_t* , int64_t , int64_t) , int64_t send_port);
};


//#endif //ANDROID_CAMERAENGINE_H
