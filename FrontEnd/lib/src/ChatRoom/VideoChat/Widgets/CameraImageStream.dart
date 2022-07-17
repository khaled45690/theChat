// ignore_for_file: file_names

import 'dart:isolate';

import 'package:flutter/material.dart';
import 'dart:ffi' as ffi; // For FFI
import 'dart:io' as io; // For Platform.isX

import 'package:permission_handler/permission_handler.dart';

typedef ReverseNative = ffi.Pointer<ffi.Void> Function(
    ffi.Pointer<ffi.Void> str);
typedef example_callback = ffi.Int64 Function(ffi.Pointer<ffi.Void>, ffi.Int64);
typedef example_foo = ffi.Int64 Function(
    ffi.Int64 bar, ffi.Pointer<ffi.NativeFunction<example_callback>>);
typedef CameraInit = int Function(
    int bar, ffi.Pointer<ffi.NativeFunction<example_callback>>);

class CameraImageStream extends StatefulWidget {
  const CameraImageStream({Key? key}) : super(key: key);

  @override
  State<CameraImageStream> createState() => _CameraImageStreamState();
}

class _CameraImageStreamState extends State<CameraImageStream> {

  var executeCallback;
  static int callback(ffi.Pointer<ffi.Void> ptr, int i) {
    print('in callback From C++ the number of frames that captured is equal to=$i');
    // print(
    //     '<<<<<<<<<<<<<<<<<<<<<<<<-----------------------i made a call back function----------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
    // print(
    //     '<<<<<<<<<<<<<<<<<<<<<<<<-----------------------this is a dart code that is being called from C++----------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
    return i + 1;
  }

  void initState() {
    checkPermission();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      height: MediaQuery.of(context).size.height - 40,
      color: Colors.white,
    );
  }

  checkPermission() async {

    final interactiveCppRequests = ReceivePort()..listen(requestExecuteCallback);
    final int nativePort = interactiveCppRequests.sendPort.nativePort;
    PermissionStatus status = await Permission.camera.status;
    Permission.notification;
    if (status.isGranted) {
      final ffi.DynamicLibrary nativeAddLib = io.Platform.isAndroid
          ? ffi.DynamicLibrary.open('libmain.so')
          : ffi.DynamicLibrary.process();
      final initializeApi = nativeAddLib.lookupFunction<ffi.IntPtr Function(ffi.Pointer<ffi.Void>),
          int Function(ffi.Pointer<ffi.Void>)>("InitDartApiDL");
      executeCallback = nativeAddLib.lookupFunction<ffi.Void Function(ffi.Pointer<Work>),
          void Function(ffi.Pointer<Work>)>('ExecuteCallback');
      CameraInit cameraInit = nativeAddLib
          .lookup<ffi.NativeFunction<example_foo>>('cameraInit')
          .asFunction();
      if(initializeApi(ffi.NativeApi.initializeApiDLData) == 0){
        cameraInit(nativePort, ffi.Pointer.fromFunction<example_callback>(callback, 0));
      }




      // final int Function(int Function str) = nativeAddLib.lookupFunction<FuntionToNative, FuntionToDart>('reverse');


    } else if (status.isDenied) {
      // checkPermission();
    }



  }

  void requestExecuteCallback(message) {
    final int work_address = message;
    final work = ffi.Pointer<Work>.fromAddress(work_address);
    // print("Dart:   Calling into C to execute callback ($work).");
    executeCallback(work);
    // print("Dart:   Done with callback.");
  }
}


class Work extends ffi.Opaque {}

Future asyncSleep(int ms) {
  return Future.delayed(Duration(milliseconds: ms));
}