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
static void (*dartCallback)(void*, uint32_t*);
static void onImageAvailable(void* context, AImageReader* reader);
static void NotifyDart(int a);
public:
    // initialize function is used to initialize the variables data
    // and then start the camera and start the image streaming process
    // and get back the images in uint32_t format
    int initialize(void (*callback)(void*, uint32_t*) , int64_t send_port);


};


//#endif //ANDROID_CAMERAENGINE_H
