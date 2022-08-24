// ignore_for_file: file_names

import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:isolate';
import 'dart:typed_data';
import 'package:ffi/ffi.dart';
import 'package:flutter/material.dart';
import 'dart:ffi' as ffi; // For FFI
import 'dart:io' as io; // For Platform.isX
import 'dart:ui' as ui show Image;
import 'package:image/image.dart' as imglib;
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';

import '../../../../DependentPlugins.dart';
import '../../../../constants/Constants.dart';

typedef ReverseNative = ffi.Pointer<ffi.Void> Function(
    ffi.Pointer<ffi.Void> str);

typedef example_callback = ffi.Int64 Function(
    ffi.Pointer<ffi.Uint8>, ffi.Int64, ffi.Int64);

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
  ImageStream imageStream = ImageStream();
  static List<int> jpgGlob = [];
  static Uint8List? jpgUinGlob;
  var executeCallback;

  static int callback(ffi.Pointer<ffi.Uint8> imageData, int imageWidth, int imageHeight) {
    int imageSize = imageWidth * imageHeight;
    List<int> imgData = imageData.asTypedList((imageSize));
    // calloc.free(imageData);
    print(imgData);
    // Uint32List imgDataUint32 = Uint8List.fromList(imgData).buffer.asUint32List() ;
    // print(imgDataUint32);
    // // { argb, abgr, rgba, bgra, rgb, bgr, luminance }


    // imglib.Image img = imglib.Image.fromBytes(imageWidth , imageHeight, imgData  , format: imglib.Format.luminance );



    // print(x);
    // print("${img.getBytes().length}");
    // imglib.Image? x = imglib.decodeImage(imgDataUint32);
    // print(x?.channels);
    // calloc.free(imageData);
    // print(img.width);
    // print(img.data);
    // imglib.PngEncoder pngEncoder = imglib.PngEncoder(level: 0, filter: 0);

    // print("Uint8List.fromList(Jpg)");
    // print(
        // 'in callback From C++ the number of frames that captured is equal to=${imgData}');
    // print(
    //     'in callback From C++ the Uint64List is equal to=${Uint64List.fromList(imgData)}');
    // print('in callback From C++ the imageWidth  equal to=$imageWidth');
    // print('in callback From C++ the imageHeight is equal to=$imageHeight');
    // var img = imglib.Image.fromBytes(imageWidth, imageHeight, imgData);
    // print('in callback From C++ the Uint32List is equal to=${img.data}');

    // imglib.PngEncoder pngEncoder = new imglib.PngEncoder(level: 0, filter: 0);
    // List<int> Jpg = imglib.encodeJpg(img , quality: 100) ;
    // print('in callback From C++ the jpeg is equal to= $Jpg');
    // List<int> png = pngEncoder.encodeImage(img);
    // print(png);


    // print(response.statusCode);
    //
    // response.stream.transform(utf8.decoder).listen((value) {
    //   Map data = jsonDecode(value);
    //
    // });

    HttpPost("saveimage" , {"imageBytes" : Uint8List.fromList(imgData), "width" :  imageWidth, "height" : imageHeight});
    ImageStream.increaseAge(Uint8List.fromList(imgData), imageWidth, imageHeight );
    // person.increaseAge(Uint8List.fromList(imgData));
    //  jpgUinGlob = Uint8List.fromList(imgData);
    return 1;
  }

  void initState() {
    checkPermission();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 1),
        child: StreamBuilder(
          stream: ImageStream.imageStream.stream,
          builder: (BuildContext context, AsyncSnapshot<ui.Image> imageData) {
            return  Container(
              width: MediaQuery.of(context).size.width - 10,
              height: MediaQuery.of(context).size.height - 10,
              child: RawImage(
                fit: BoxFit.cover,
                image: imageData.data,
              ),
            );

            //   CustomPaint(
            //   painter: MyCustomPainter(imageData.data),
            //   willChange: true,
            //   size: Size(200 , 200),
            // );
          },
        ),
      )
    );
  }

  checkPermission() async {
    final interactiveCppRequests = ReceivePort()
      ..listen(requestExecuteCallback);
    final int nativePort = interactiveCppRequests.sendPort.nativePort;
    PermissionStatus status = await Permission.camera.status;
    if (status.isGranted) {
      final ffi.DynamicLibrary nativeAddLib = io.Platform.isAndroid
          ? ffi.DynamicLibrary.open('libmain.so')
          : ffi.DynamicLibrary.process();
      final initializeApi = nativeAddLib.lookupFunction<
          ffi.IntPtr Function(ffi.Pointer<ffi.Void>),
          int Function(ffi.Pointer<ffi.Void>)>("InitDartApiDL");
      executeCallback = nativeAddLib.lookupFunction<
          ffi.Void Function(ffi.Pointer<Work>),
          void Function(ffi.Pointer<Work>)>('ExecuteCallback');
      CameraInit cameraInit = nativeAddLib
          .lookup<ffi.NativeFunction<example_foo>>('cameraInit')
          .asFunction();
      if (initializeApi(ffi.NativeApi.initializeApiDLData) == 0) {
        cameraInit(nativePort,
            ffi.Pointer.fromFunction<example_callback>(callback, 0));
      }

      // final int Function(int Funstr) = nativeAddLib.lookupFunction<FuntionToNative, FuntionToDart>('reverse');

    } else if (status.isDenied) {
      // checkPermission();
    }
  }

  void requestExecuteCallback(message) async {
    print('in callback From C++ the function will fire');
    final int workAddress = message;
    final work = ffi.Pointer<Work>.fromAddress(workAddress);

    // print("Dart:   Calling into C to execute callback ($work).");
    executeCallback(work);
    // print("Dart:   Done with callback.");
  }
}

class Work extends ffi.Opaque {}

Future asyncSleep(int ms) {
  return Future.delayed(Duration(milliseconds: ms));
}

class ImageStream {
  static StreamController<ui.Image> imageStream = StreamController<ui.Image>();
  static void increaseAge(
  Uint8List imageDataParameter, int width, int height) async {
    // print(imageDataParameter);
    imageStream.sink.add(await decodeImageFromList(imageDataParameter));
  }
}

class MyCustomPainter extends CustomPainter {
  final ui.Image? myBackground;
  const MyCustomPainter(this.myBackground);

  @override
  void paint(Canvas canvas, Size size) {
    Paint painter = Paint();
    painter.style = PaintingStyle.fill;
    myBackground != null ?  canvas.drawImage(myBackground!, Offset.zero, painter) : print("myBackground is null");;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
