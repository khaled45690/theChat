// ignore_for_file: prefer_const_constructors


import 'package:camera/camera.dart';
import 'package:chat/src/ChatRoom/VideoChat/Widgets/CameraImageStream.dart';
import 'package:chat/src/PoseDetector/PoseDetector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'businesslogic/UserData/UserBloc.dart';
import 'businesslogic/socket/SocketCubit.dart';
List<CameraDescription> cameras = [];
void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<SocketCubit>(
      create: (BuildContext context) => SocketCubit(),
    ),
    BlocProvider<UserBloc>(
      create: (BuildContext context) => UserBloc(),
    ),
  ], child: const Chat()));
}

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat',
      theme: ThemeData(),
      home:  CameraImageStream(),
    );
  }
}


