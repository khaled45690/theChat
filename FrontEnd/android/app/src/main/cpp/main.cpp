//
// Created by khaled on 7/3/2022.
//
#include <string>
#include <stdint.h>
#include "src/CameraEngine.h"



CameraEngine cameraEngine =  CameraEngine();

extern "C" __attribute__((visibility("default"))) __attribute__((used))
 void cameraInit(int64_t send_port,void (*callback)(uint8_t* , int64_t , int64_t)) {
    cameraEngine.initialize(callback , send_port);
}


extern "C" __attribute__((visibility("default"))) __attribute__((used))
void ExecuteCallback(Work* work_ptr) {
    const Work work = *work_ptr;
    work();
    delete work_ptr;
}


extern "C" __attribute__((visibility("default"))) __attribute__((used))
intptr_t InitDartApiDL(void* data) {
    return Dart_InitializeApiDL(data);
}