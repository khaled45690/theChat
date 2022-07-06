//
// Created by khaled on 7/3/2022.
//

#include <camera/NdkCameraManager.h>
#include <media/NdkImageReader.h>
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
static void (*dartCallback)(void*, int32_t);
static void onImageAvailable(void* context, AImageReader* reader);
public:
    // initialize function is used to initialize the variables data
    // and then start the camera and start the image streaming process
    // and get back the images in uint32_t format
    int initialize(void (*callback)(void*, int32_t));
};


//#endif //ANDROID_CAMERAENGINE_H
