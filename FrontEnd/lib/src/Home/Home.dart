import 'package:chat/businesslogic/socket/socket_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socket_io_client/socket_io_client.dart';

import '../../CommonStyle.dart';
import '../../businesslogic/socket/socket_cubit.dart';
import 'Widgets/HomeAppBar.dart';
import 'Widgets/FloatingButton.dart';
import 'Widgets/MessageRoomsLayout.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  initState(){
    super.initState();
    print("entered");
    context.read<SocketCubit>().connect();
    context.read<SocketCubit>().socket!.emit("message", "message");
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SocketCubit(),
      child: BlocBuilder<SocketCubit, SocketStates>(
          builder: (BuildContext context, state) {
            // this context relate to the context of cubit
            // SocketCubit cubit = SocketCubit.get(context);
            // cubit.connect();
            // cubit.socket!.emit("connected", "connected");
            return Scaffold(
              extendBodyBehindAppBar: true,
              drawer: Container(),
              appBar: HomeAppBar(),
              floatingActionButton: FloatingButton(),
              body: Container(
                decoration: scaffoldDecoration,
                child: Column(
                  children: const [
                    SizedBox(
                      height: 100,
                    ),
                    MessageRoomsLayout(),
                    MessageRoomsLayout(),
                    MessageRoomsLayout(),
                    MessageRoomsLayout(),
                    MessageRoomsLayout(),
                  ],
                ),
              ),
            );
          }),);
  }
}
