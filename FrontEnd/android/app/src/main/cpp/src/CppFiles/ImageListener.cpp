//
// this is only used to observe the images comming from camera device.
//
#include "../CameraEngine.h"
int i = 0;
 void CameraEngine::onImageAvailable(void *context, AImageReader *reader) {
     AImage *image;
     AImageReader_acquireNextImage(reader, &image);
     dartCallback( nullptr,i++);
     AImage_delete(image);
}
