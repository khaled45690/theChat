//
// Created by khaled on 7/3/2022.
//
#include <string>
#include <stdint.h>
#include "src/CameraEngine.h"
CameraEngine cameraEngine =  CameraEngine();
extern "C" __attribute__((visibility("default"))) __attribute__((used))
 void cameraInit(
                    int32_t bar,
                    void (*callback)(void*, int32_t)
                    ) {


    callback(nullptr, cameraEngine.initialize());
}