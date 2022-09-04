//
// Created by khaled on 7/3/2022.
//

// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//                                    !!!!!this is very important!!!!!!!                                 //
//  despite what it looks these are the steps to open camera and to get images out of it from native C++ //
//  first you open camera manager , then get device ids to know available camera                         //
//  for preview we make native window from this function ANativeWindow_fromSurface                       //
//  create output to be used later to direct the camera where the output of the camera is going          //
//  we use this function (ACaptureSessionOutput_create) to create them from native windows               //
//  then make outputs Container to hold the outputs that made                                            //
//  by this function ACaptureSessionOutputContainer_add                                                  //
//  apparently i need to set a output target  with this function (ACameraOutputTarget_create)            //
//  then create a capture request (ACameraDevice_createCaptureRequest)                                   //
//  add the out put target to the capture request this is very important (ACaptureRequest_addTarget)     //
//  then create the session (ACameraDevice_createCaptureSession)                                         //
//  then take pics or one photo or burst of images with different functions                              //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //


#include "../CameraEngine.h"
#include <android/log.h>
void SessionCaptureCallback_OnFailed(void* context,
                                     ACameraCaptureSession* session,
                                     ACaptureRequest* request,
                                     ACameraCaptureFailure* failure) {

}

void SessionCaptureCallback_OnSequenceEnd(void* context,
                                          ACameraCaptureSession* session,
                                          int sequenceId, int64_t frameNumber) {

}
void SessionCaptureCallback_OnSequenceAborted(void* context,
                                              ACameraCaptureSession* session,
                                              int sequenceId) {

}

void SessionCaptureCallback_OnStarted(
        void* context, ACameraCaptureSession* session,
        const ACaptureRequest* request, int64_t timestamp) {


}
ACameraDevice_StateCallbacks openCameraCallback{
        .context= nullptr,
        .onDisconnected = nullptr,
        .onError = nullptr,
};
AImageReader_ImageListener listener{
        .context = nullptr,
        .onImageAvailable = nullptr,
};
ACameraCaptureSession_stateCallbacks sessionListener{
        .context = nullptr,
        .onActive = nullptr,
        .onClosed = nullptr,
        .onReady = nullptr,
};

ACameraCaptureSession_captureCallbacks captureListener{
        .context = nullptr,
        .onCaptureStarted = SessionCaptureCallback_OnStarted,
        .onCaptureProgressed = nullptr,
        .onCaptureCompleted = nullptr,
        .onCaptureFailed = SessionCaptureCallback_OnFailed,
        .onCaptureSequenceCompleted = SessionCaptureCallback_OnSequenceEnd,
        .onCaptureSequenceAborted = SessionCaptureCallback_OnSequenceAborted,
        .onCaptureBufferLost = nullptr,
};

int CameraEngine::initialize(void (*callback)(uint8_t* , int64_t , int64_t) , int64_t send_port) {
    // set the dartCallbackFunction to the parsed callback to use it in Image listener
    dartCallback = callback;
    // set the dart port that will listen for the up coming to the parsed dart send port to use it in Image listener
    dartSendPort = send_port;
// first of all we need this manager to be able to control our camera system
    manager = ACameraManager_create();
    // then create a output container to hold our sessions
    ACaptureSessionOutputContainer_create(&container);
    // get camera Id to be able to open the device
    ACameraManager_getCameraIdList(manager, &cameraIdList);
    // open the camera device to be able to get the image stream from it
    //callBack can't be nullptr
    ACameraManager_openCamera(manager, cameraIdList->cameraIds[0], &openCameraCallback,&device);
    //create new reader to capture the stream of images
    AImageReader_new(420,300 , AIMAGE_FORMAT_YUV_420_888, 10 , &reader);
//    ACameraMetadata *characteristics;
//    ACameraManager_getCameraCharacteristics(manager, cameraIdList->cameraIds[0], &characteristics);

//    __android_log_print(ANDROID_LOG_INFO, "Information", "the data enrty  -------------------->>>> %d" , entry->data.i32);
    //get the reader native window
    AImageReader_getWindow(reader , &AImageNativeWindow);
    listener.onImageAvailable = onImageAvailableYUVtoRGB;
    //set listener  tofunction will be called when there is new pics captured
    AImageReader_setImageListener(reader , &listener);
    // this will create target output to direct the image stream to the native window
    // we can create more than one target for the same stream of images
    ACameraOutputTarget_create(AImageNativeWindow, &targetOutput1);
    // this will create session output from native window
    ACaptureSessionOutput_create(AImageNativeWindow,&output);
    // this is used to add the session output to the CaptureSessionOutputContainer
    ACaptureSessionOutputContainer_add(container,output);
    // this is used to create the request which will be added to create image stream
    ACameraDevice_createCaptureRequest(device,TEMPLATE_PREVIEW, &request);
    // add the out put target to the capture request this is very important
    ACaptureRequest_addTarget(request,targetOutput1);
//    uint8_t degree = 90;
//    ACaptureRequest_setEntry_u8(request, ACAMERA_SENSOR_ORIENTATION, 1, &degree);
    ACameraDevice_createCaptureSession(device, container, &sessionListener, &session);
    int captureSequenceId = 2;
//    ACameraCaptureSession_capture(session, &captureListener,1 , &request, &captureSequenceId);
    ACameraCaptureSession_setRepeatingRequest(session, &captureListener, 1, &request, &captureSequenceId);

    return 2030;
}

void (*CameraEngine::dartCallback)(uint8_t* , int64_t , int64_t) = nullptr;

int64_t CameraEngine::dartSendPort = 0;

int CameraEngine::clamp(int i) {
    if(i > 255){
        return 255;
    }else if(i < 0){
        return 0;
    }else{
        return i;
    }
}

