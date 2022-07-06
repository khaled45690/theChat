import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:ffi' as ffi; // For FFI
import 'dart:io'; // For Platform.isX
import 'dart:io' as io; // For Platform.isX
import 'package:flutter/services.dart';
import 'dart:io' show Directory, Platform;

import 'package:permission_handler/permission_handler.dart';

typedef ReverseNative = ffi.Pointer<ffi.Void> Function(
    ffi.Pointer<ffi.Void> str);
typedef example_callback = ffi.Int32 Function(ffi.Pointer<ffi.Void>, ffi.Int32);
typedef example_foo = ffi.Int32 Function(
    ffi.Int32 bar, ffi.Pointer<ffi.NativeFunction<example_callback>>);
typedef ExampleFoo = int Function(
    int bar, ffi.Pointer<ffi.NativeFunction<example_callback>>);

class CameraImageStream extends StatefulWidget {
  const CameraImageStream({Key? key}) : super(key: key);

  @override
  State<CameraImageStream> createState() => _CameraImageStreamState();
}

class _CameraImageStreamState extends State<CameraImageStream> {
  static int callback(ffi.Pointer<ffi.Void> ptr, int i) {
    print('in callback i=$i');
    print(
        '<<<<<<<<<<<<<<<<<<<<<<<<-----------------------i made a call back function----------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
    print(
        '<<<<<<<<<<<<<<<<<<<<<<<<-----------------------this is a dart code that is being called from C++----------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
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
    print("status.isGranted");
    PermissionStatus status = await Permission.camera.status;
    Permission.notification;
    print(status.isGranted);
    if (status.isGranted) {
      final ffi.DynamicLibrary nativeAddLib = io.Platform.isAndroid
          ? ffi.DynamicLibrary.open('libmain.so')
          : ffi.DynamicLibrary.process();
      // final int Function(int Function str) = nativeAddLib.lookupFunction<FuntionToNative, FuntionToDart>('reverse');
      ExampleFoo nativeFoo = nativeAddLib
          .lookup<ffi.NativeFunction<example_foo>>('cameraInit')
          .asFunction();
      nativeFoo(5, ffi.Pointer.fromFunction<example_callback>(callback, 0));
    } else if (status.isDenied) {
      checkPermission();
    }
  }
}
