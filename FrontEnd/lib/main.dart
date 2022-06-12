import 'package:chat/src/Home/Home.dart';
import 'package:chat/src/Registration/Registration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'businesslogic/UserData/UserData_cubit.dart';
import 'businesslogic/socket/socket_cubit.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider<SocketCubit>(
      create: (BuildContext context) => SocketCubit(),
    ),
    BlocProvider<UserDataCubit>(
      create: (BuildContext context) => UserDataCubit(),
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
      home: const Registration(true),
    );
  }
}
