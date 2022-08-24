//
// Created by khaled on 7/18/2022.
//
#include <cstdio>
#include <chrono>
#include "../CameraEngine.h"
#include <android/log.h>
using namespace std::chrono;


void CameraEngine::onImageAvailableJPEG(void* context, AImageReader* reader) {
    auto start = high_resolution_clock::now();
    // in order to get the image from the memory we use the reader pointer
    // and the AImageReader_acquireNextImage to get the current the next available image in the memory
    // even if we don't use this image we need to acquire image and delete it from the memory
    // to make the whole process stableas possible i use the YUV_420_888 format and convert it to RGB color space format
    AImage *image;
    AImageReader_acquireNextImage(reader, &image);

    // in order to do the conversion i also aquire the width and height of the image

        int32_t height;
        int32_t width;
        AImage_getHeight(image , &height);
        AImage_getWidth(image , &width);


        uint8_t *imagedata;
        int imagedataLength;
        AImage_getPlaneData(image, 0 , &imagedata, &imagedataLength);

    __android_log_print(ANDROID_LOG_INFO, "Information", "num OF platesis -------------------->>>> %d " , imagedata);
//        NotifyDart(imagedata , width , height);




    AImage_delete(image);


    auto end = high_resolution_clock::now();


    auto duration = duration_cast<milliseconds>(end - start);


    __android_log_print(ANDROID_LOG_INFO, "Information", "the time consumed is -------------------->>>> %d ms" , duration.count());

}