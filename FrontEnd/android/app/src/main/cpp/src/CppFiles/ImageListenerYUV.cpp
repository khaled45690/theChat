//
// this is only used to observe the images comming from camera device.
//
#include <cstdio>
#include <chrono>
#include "../CameraEngine.h"
#include <android/log.h>
using namespace std::chrono;
int i = 0;
 void CameraEngine::onImageAvailableYUVtoRGB(void *context, AImageReader *reader) {
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

     // there are three planes of the YUV_420_888 that has different values with different meaning
     // there is the Y buffer which has the image data in greyscale format
     // the U and V buffer represent the color channels that if mixed with the Y buffer make the image Colored
     // so in the next step we aquire the three buffers data and length in order  to be converted to RGB
     uint8_t *ydata;
     uint8_t *udata;
     uint8_t *vdata;

     int ydataLength;
     int udataLength;
     int vdataLength;

     AImage_getPlaneData(image, 0 , &ydata, &ydataLength);
     AImage_getPlaneData(image, 1 , &udata, &udataLength);
     AImage_getPlaneData(image, 2 , &vdata, &vdataLength);

     // also one of the important information about the image is it's three planes Pixel Stride and Row Stride
     // to know more about the strides and what they do head to https://docs.microsoft.com/en-us/windows/win32/medfound/image-stride

     int32_t yPixelStride;
     int32_t uPixelStride;
     int32_t vPixelStride;
     AImage_getPlanePixelStride(image, 0 , &yPixelStride);
     AImage_getPlanePixelStride(image, 1 , &uPixelStride);
     AImage_getPlanePixelStride(image, 2 , &vPixelStride);


     int32_t yRowStride;
     int32_t uRowStride;
     int32_t vRowStride;
     AImage_getPlaneRowStride(image, 0 , &yRowStride);
     AImage_getPlaneRowStride(image, 1 , &uRowStride);
     AImage_getPlaneRowStride(image, 2 , &vRowStride);

     int numPixels = int(11) ;
     __android_log_print(ANDROID_LOG_INFO, "Information", "the time consumed is -------------------->>>> %d " , numPixels);
     uint32_t* nv21 = (uint32_t*)malloc(numPixels);
     int yp, up, vp;
     for(int x=0; x < width - 1; x++) {
         for(int y=0; y < height -1; y++) {
              int uvIndex = uPixelStride * (int)(x/2) + uRowStride * (int)(y/2);

              int index = y * width + x ;
              up = udata[uvIndex];
              vp = vdata[uvIndex];
            int yIndex = (y * yRowStride) + (x * yPixelStride);
            yp = (ydata[yIndex] & 0xff);
             // Calculate pixel color


              int r = clamp((int)(yp + vp * 1436 / 1024 - 179));
              int g = clamp((int)(yp - up * 46549 / 131072 + 44 -vp * 93604 / 131072 + 91));
              int b = clamp((int)(yp + up * 1814 / 1024 - 227));


              nv21[index] = (0xFF << 24) | (b << 16) | (g << 8) | r ;
         }
     }
      auto end = high_resolution_clock::now();
       auto duration = duration_cast<milliseconds>(end - start);
     __android_log_print(ANDROID_LOG_INFO, "Information", "the time consumed is -------------------->>>> %d ms" , duration.count());

//     __android_log_print(ANDROID_LOG_INFO, "khaled", "the first element is -------------------->>>> %d" ,  nv21[0] );

//     NotifyDart(nv21 , width , height);
//     free(nv21);
     AImage_delete(image);

}




