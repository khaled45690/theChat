//
// this is only used to observe the images comming from camera device.
//
#include <cstdio>
#include <chrono>
#include "../CameraEngine.h"
#include <android/log.h>
#include <opencv2/opencv.hpp>
#include "libyuv/rotate.h"
#include "libyuv.h"
#include "jpeglib.h"

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
     uint8_t *rawRGB;


     int ydataLength;
     int udataLength;
     int vdataLength;
     AImage_getPlaneData(image, 0 , &ydata, &ydataLength);
     AImage_getPlaneData(image, 1 , &udata, &udataLength);
     AImage_getPlaneData(image, 2 , &vdata, &vdataLength);
     uint8_t *ydata_dst = (uint8_t *)malloc(ydataLength);
     uint8_t *udata_dst = (uint8_t *)malloc(udataLength);
     uint8_t *vdata_dst = (uint8_t *)malloc(udataLength);


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

     int size_dest = width * height * 4;
     rawRGB = (uint8_t *)malloc(size_dest);

//     int Android420ToI420(const uint8_t* src_y,
//                          int src_stride_y,
//                          const uint8_t* src_u,
//                          int src_stride_u,
//                          const uint8_t* src_v,
//                          int src_stride_v,
//                          int src_pixel_stride_uv,
//                          uint8_t* dst_y,
//                          int dst_stride_y,
//                          uint8_t* dst_u,
//                          int dst_stride_u,
//                          uint8_t* dst_v,
//                          int dst_stride_v,
//                          int width,
//                          int height);
//     int Android420ToABGR(const uint8_t* src_y,
//                          int src_stride_y,
//                          const uint8_t* src_u,
//                          int src_stride_u,
//                          const uint8_t* src_v,
//                          int src_stride_v,
//                          int src_pixel_stride_uv,
//                          uint8_t* dst_abgr,
//                          int dst_stride_abgr,
//                          int width,
//                          int height) {
//         return Android420ToARGBMatrix(src_y, src_stride_y, src_v, src_stride_v, src_u,
//                                       src_stride_u, src_pixel_stride_uv, dst_abgr,
//                                       dst_stride_abgr, &kYvuI601Constants, width,
//                                       height);
//     }
//

//     libyuv::Android420ToI420(ydata , yRowStride , udata , uRowStride , vdata , vRowStride, uPixelStride , ydata_dst , yRowStride , udata_dst ,uRowStride  , vdata_dst ,vRowStride , width , height);


         libyuv::Android420ToARGB(ydata , yRowStride , udata , uRowStride , vdata , vRowStride, uPixelStride , rawRGB , width * 4 , width , height);
//         libyuv::I420ToABGR(ydata_dst , yRowStride , udata_dst , uRowStride , vdata_dst , vRowStride, rawRGB , width * 4 , width , height);
         cv::Size actual_size(width, height);
//     cv::Size half_size(width/2, height/2);
//
         cv::Mat rawRGBMat(actual_size, CV_8UC4 ,rawRGB);
         cv::Mat rotatedImage;
         cv::rotate(rawRGBMat, rotatedImage, cv::ROTATE_90_CLOCKWISE);
         std::vector<uchar> outputImage;
         cv::imencode(".jpg", rotatedImage, outputImage);
         NotifyDart(outputImage.data(), width , height);

//

//     uint8_t *rotatedRawRGB = (uint8_t *)malloc(size_dest);
//     libyuv::RotatePlane(rawRGB, width * 3,
//                         rotatedRawRGB, width * 3,
//                         width, height, libyuv::kRotate270);
//     __android_log_print(ANDROID_LOG_INFO, "Information", "the row stride is bigger than the width -------------------->>>> %d" , rawRGBRowStride);
//     __android_log_print(ANDROID_LOG_INFO, "Information", "the row stride is bigger than the width -------------------->>>> %d" , uRowStride);
//     j_compress_ptr cinfo;
////     cinfo->in_color_space = JCS_EXT_RGB;
//
//     jpeg_error_mgr jerr;
//     cinfo->err = jpeg_std_error(&jerr);
//     unsigned char *outputJPEG;
//     unsigned long outsize;
//
//     jpeg_create_compress(cinfo);
//     jpeg_mem_dest(cinfo , &outputJPEG , &outsize);
//     cinfo->image_width = width;      /* image width and height, in pixels */
//     cinfo->image_height = height;
//     cinfo->input_components = 3;           /* # of color components per pixel */
//     cinfo->in_color_space = JCS_RGB;/* colorspace of input image */

//     jpeg_set_defaults(cinfo);
//
//     jpeg_set_quality(cinfo, 80, TRUE);
//
//     jpeg_start_compress(cinfo, TRUE);
//     int row_stride = width * 3; /* JSAMPLEs per row in image_buffer */
//     JSAMPROW row_pointer[1];
//     while (cinfo->next_scanline < cinfo->image_height) {
//         /* jpeg_write_scanlines expects an array of pointers to scanlines.
//          * Here the array is only one element long, but you could pass
//          * more than one scanline at a time if that's more convenient.
//          */
//         row_pointer[0] = &rawRGB[cinfo->next_scanline * row_stride];
//         (void)jpeg_write_scanlines(cinfo, row_pointer, 1);
//     }
//
//     jpeg_finish_compress(cinfo);
//     jpeg_destroy_compress(cinfo);
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




//     cv::Size actual_size(width, height);
//     cv::Size half_size(width/2, height/2);
//
//     cv::Mat rawRGBMat(actual_size, CV_8UC4 ,rawRGB);
//
//
//     cv::Mat rawRGBMat(actual_size, CV_8UC3,rawRGB);
//     cv::Mat u(half_size, CV_8UC1,udata);
//     cv::Mat v(half_size, CV_8UC1, vdata);
//
//     cv::Mat u_resized, v_resized;
//     cv::resize(u, u_resized, actual_size, 0, 0, cv::INTER_NEAREST); //repeat u values 4 times
//     cv::resize(v, v_resized, actual_size, 0, 0, cv::INTER_NEAREST); //repeat v values 4 times
//
//     cv::Mat yuv;
//
//     std::vector<cv::Mat> yuv_channels = { y, u_resized, v_resized };
//     cv::merge(yuv_channels, yuv);
//
//     y.release();
//     u.release();
//     v.release();
//
//
//
//     cv::Mat bgr;
//     cv::cvtColor(yuv, bgr, cv::COLOR_YUV2BGR);
//     cv::Mat rotatedImage;
//     cv::rotate(rawRGBMat, rotatedImage, cv::ROTATE_90_CLOCKWISE);
//     std::vector<uchar> outputImage;
//     cv::imencode(".jpeg", rotatedImage, outputImage);

      auto end = high_resolution_clock::now();
       auto duration = duration_cast<milliseconds>(end - start);
     __android_log_print(ANDROID_LOG_INFO, "Information", "the time consumed is -------------------->>>> %d ms" , duration.count());
//     __android_log_print(ANDROID_LOG_INFO, "Information", "the time consumed is -------------------->>>> %d ms" , outputImage.data()[0]);

//     __android_log_print(ANDROID_LOG_INFO, "khaled", "the first element is -------------------->>>> %d" ,  nv21[0] );

//     NotifyDart(outputImage.data(), width , height);
//     nv21RGBA.release();
//     outputImage.clear();
     free(rawRGB);
     free(ydata_dst);
     free(udata_dst);
     free(vdata_dst);
     rawRGBMat.release();
//     free(rotatedRawRGB);
//     free(outputJPEG);
     AImage_delete(image);

}




