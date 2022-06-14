import 'package:chat/businesslogic/socket/socket_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socket_io_client/socket_io_client.dart';

import '../../CommonStyle.dart';
import '../../businesslogic/socket/socket_cubit.dart';
import 'Control/HomeControl.dart';
import 'Widgets/CustomDrawer.dart';
import 'Widgets/HomeAppBar.dart';
import 'Widgets/FloatingButton.dart';
import 'Widgets/MessageRoomsLayout.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late HomeControl homeControl;
  String qrcodeResult = "";
  @override
  initState(){
    homeControl = HomeControl(this);
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
            return Scaffold(
              extendBodyBehindAppBar: true,
              drawer: CustomDrawer(),
              appBar: HomeAppBar(),
              floatingActionButton: FloatingButton(homeControl.addFriend),
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
