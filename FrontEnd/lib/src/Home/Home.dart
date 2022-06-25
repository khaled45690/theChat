// ignore_for_file: file_names, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../CommonStyle.dart';
import '../../businesslogic/UserData/UserDataModel.dart';
import '../../businesslogic/UserData/UserBloc.dart';
import '../../businesslogic/socket/SocketCubit.dart';
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
  @override
  initState(){
    homeControl = HomeControl(this);
    super.initState();
    context.read<SocketCubit>().connect();
    context.read<SocketCubit>().socket!.emit("firstTime", context.read<UserBloc>().getUserData().id);

  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    context.watch<SocketCubit>().setContext(context);
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
              extendBodyBehindAppBar: true,
              drawer: CustomDrawer(),
              appBar: HomeAppBar(),
              floatingActionButton: FloatingButton(homeControl.addFriend),
              body: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: scaffoldDecoration,
                child: BlocBuilder<UserBloc, UserData?>(
                  builder: (context , userData) {
                    Map friends = jsonDecode(userData!.friends!);
                    return Column(
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
                        for(int i = friends.length - 1 ; i > -1 ; i--)
                        MessageRoomsLayout(friends[userData.chatOrder![i]] , userData.chatOrder![i]),
                      ],
                    );
                  }
                ),
              ),
            );
  }
}
