// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';
//
// import 'Painters/pose_painter.dart';
// import 'Widgets/camera_view.dart';
//
// class PoseDetectorScreen extends StatefulWidget {
//   const PoseDetectorScreen({Key? key}) : super(key: key);
//
//   @override
//   State<StatefulWidget> createState() => _PoseDetectorScreenState();
// }
//
// class _PoseDetectorScreenState extends State<PoseDetectorScreen> {
//   final PoseDetector _poseDetector =
//   PoseDetector(options: PoseDetectorOptions());
//   bool _canProcess = true;
//   bool _isBusy = false;
//   CustomPaint? _customPaint;
//   String? _text;
//
//   @override
//   void dispose() async {
//     _canProcess = false;
//     _poseDetector.close();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return CameraView(
//       title: 'Pose Detector',
//       customPaint: _customPaint,
//       text: _text,
//       onImage: (inputImage) {
//         processImage(inputImage);
//       },
//     );
//   }
//
//   Future<void> processImage(InputImage inputImage) async {
//     if (!_canProcess) return;
//     if (_isBusy) return;
//     _isBusy = true;
//     setState(() {
//       _text = '';
//     });
//     final poses = await _poseDetector.processImage(inputImage);
//     if (inputImage.inputImageData?.size != null &&
//         inputImage.inputImageData?.imageRotation != null) {
//       final painter = PosePainter(poses, inputImage.inputImageData!.size,
//           inputImage.inputImageData!.imageRotation);
//       _customPaint = CustomPaint(painter: painter);
//     } else {
//       _text = 'Poses found: ${poses.length}\n\n';
//       // TODO: set _customPaint to draw landmarks on top of image
//       _customPaint = null;
//     }
//     _isBusy = false;
//     if (mounted) {
//       setState(() {});
//     }
//   }
// }
