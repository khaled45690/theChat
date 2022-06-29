// ignore_for_file: prefer_const_constructors

import 'package:chat/src/SplashScreen/SpashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'businesslogic/UserData/UserBloc.dart';
import 'businesslogic/socket/SocketCubit.dart';

void main() {
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
      home:  SplashScreen(),
    );
  }
}


