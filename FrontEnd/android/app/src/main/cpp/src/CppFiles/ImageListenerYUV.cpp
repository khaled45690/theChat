//
// this is only used to observe the images comming from camera device.
//
#include <cstdio>
#include <chrono>
#include "../CameraEngine.h"
#include <android/log.h>
#include <opencv2/opencv.hpp>
#include "../yuv/include/libyuv.h"

using namespace std::chrono;
using namespace cv;
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
     uint8_t *rawRGB = nullptr;

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
     int32_t rawRGBRowStride = 0;
     AImage_getPlaneRowStride(image, 0 , &yRowStride);
     AImage_getPlaneRowStride(image, 1 , &uRowStride);
     AImage_getPlaneRowStride(image, 2 , &vRowStride);

     //int I420ToRAW(const uint8_t* src_y,
     //              int src_stride_y,
     //              const uint8_t* src_u,
     //              int src_stride_u,
     //              const uint8_t* src_v,
     //              int src_stride_v,
     //              uint8_t* dst_raw,
     //              int dst_stride_raw,
     //              int width,
     //              int height);


     libyuv::I420ToRAW(ydata , yRowStride , udata , uRowStride , vdata , vRowStride , rawRGB , rawRGBRowStride , width , height);


if(uRowStride > width){
    __android_log_print(ANDROID_LOG_INFO, "Information", "the row stride is bigger than the width -------------------->>>> ");
}
//     int numPixels = width * height * 2;
//     uint8_t* nv21 = (uint8_t*)malloc(numPixels);
//     int yp, up, vp;
//
//     for(int y=0; y < height ; y++) {
//         for(int x=0; x < width ; x++) {
//              int uvIndex = uPixelStride * (int)(x/2) + uRowStride * (int)(y/2);
//
//              int index = y * width + x ;
//              up = (udata[uvIndex] & 0xff);
//              vp = (vdata[uvIndex] & 0xff) ;
//            int yIndex = (y * yRowStride) + (x * yPixelStride);
//            yp = (ydata[yIndex] & 0xff);
////            yp = (ydata[yIndex] & 0xff);
//             // Calculate pixel color
//
//
////              int r = clamp((int)(yp +  (1.370705f * (vp - 128))));
////              int g = clamp((int)(yp -  (0.698001f * (up - 128)) - (0.337633f * (vp - 128))));
////              int b = clamp((int)(yp + (1.732446f * (up - 128))));
//
//             int r = clamp((int)(yp + vp * 1436 / 1024 - 179));
//             int g = clamp((int)(yp - up * 46549 / 131072 + 44 -vp * 93604 / 131072 + 91));
//             int b = clamp((int)(yp + up * 1814 / 1024 - 227));
//
////             __android_log_print(ANDROID_LOG_INFO, "Information", "the index is bigger than array size %d " , numPixels > index);
////                    nv21[index] = (r << 24) | (g << 16) | (b << 8) |  0xFF;
////                    nv21[index] = (0xFF << 24) | (b << 16) | (g << 8) | r ;
//                    nv21[index] = (b << 16) | (g << 8) | r ;
////             nv21[index + 0] = r;
////             nv21[index + 1] = g;
////             nv21[index + 2] = b;
////             nv21[index + 3] = 0xFF;
//
//         }
//     }




     cv::Size actual_size(width, height);
     cv::Size half_size(width/2, height/2);

//     cv::Mat nv21RGBA(actual_size, CV_8UC4 ,nv21);


     cv::Mat y(actual_size, CV_8UC1,ydata);
     cv::Mat u(half_size, CV_8UC1,udata);
     cv::Mat v(half_size, CV_8UC1, vdata);

     cv::Mat u_resized, v_resized;
     cv::resize(u, u_resized, actual_size, 0, 0, cv::INTER_NEAREST); //repeat u values 4 times
     cv::resize(v, v_resized, actual_size, 0, 0, cv::INTER_NEAREST); //repeat v values 4 times

     cv::Mat yuv;

     std::vector<cv::Mat> yuv_channels = { y, u_resized, v_resized };
     cv::merge(yuv_channels, yuv);

     y.release();
     u.release();
     v.release();



     cv::Mat bgr;
     cv::cvtColor(yuv, bgr, cv::COLOR_YUV2BGR);
     cv::Mat rotatedImage;
     cv::rotate(bgr, rotatedImage, cv::ROTATE_90_CLOCKWISE);
     std::vector<uchar> outputImage;
     cv::imencode(".jpeg", rotatedImage, outputImage);

      auto end = high_resolution_clock::now();
       auto duration = duration_cast<milliseconds>(end - start);
     __android_log_print(ANDROID_LOG_INFO, "Information", "the time consumed is -------------------->>>> %d ms" , duration.count());
//     __android_log_print(ANDROID_LOG_INFO, "Information", "the time consumed is -------------------->>>> %d ms" , outputImage.data()[0]);

//     __android_log_print(ANDROID_LOG_INFO, "khaled", "the first element is -------------------->>>> %d" ,  nv21[0] );

     NotifyDart(outputImage.data(), width , height);
//     nv21RGBA.release();
//     outputImage.clear();
//     free(nv21);
     AImage_delete(image);

}




