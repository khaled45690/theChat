//
// Created by khaled on 7/16/2022.
//

#include "../CameraEngine.h"

void CameraEngine::NotifyDart(int a) {
    auto callback = dartCallback;  // Define storage duration.
    const Work work = [a, callback]() { callback(nullptr , a); };
    // Copy to heap to make it outlive the function scope.
    const Work* work_ptr = new Work(work);
    const intptr_t work_addr = reinterpret_cast<intptr_t>(work_ptr);

    Dart_CObject dart_object;
    dart_object.type = Dart_CObject_kInt64;
    dart_object.value.as_int64 = work_addr;
//    Dart_CloseNativePort_DL(dartSendPort);
    Dart_PostCObject_DL(dartSendPort, &dart_object);
//    Dart_PostCObject_DL(dartSendPort, &dart_object);

}

