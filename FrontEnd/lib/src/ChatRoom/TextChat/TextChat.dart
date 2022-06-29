// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../CommonStyle.dart';
import '../../../businesslogic/UserData/UserBloc.dart';
import '../../../businesslogic/UserData/UserDataModel.dart';
import 'Control/TextChatControl.dart';
import 'Widgets/MessageSender.dart';
import 'Widgets/Messages.dart';
import 'Widgets/TextChatAppBar.dart';

class TextChat extends StatefulWidget {
  final Map friend;
  final String friendId;
  const TextChat(this.friend, this.friendId);

  @override
  State<TextChat> createState() => TextChatState();
}

class TextChatState extends State<TextChat> {
  late TextChatControl textChatControl ;
  ScrollController scrollController = ScrollController();
  TextEditingController messageController = TextEditingController();
  @override
  initState(){
    super.initState();
    textChatControl = TextChatControl(this);
  }
  bool expand = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const TextChatAppBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: scaffoldDecoration,
        padding: EdgeInsets.only(top: 100),
        child: Stack(
          children: [
            SizedBox(
              height:MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                controller: scrollController,
                scrollDirection: Axis.vertical,
                child: BlocBuilder<UserBloc, UserData?>(
                 builder: (context , userData) {
                   Map friends = jsonDecode(userData!.friends!);
                   Map friend = friends[widget.friendId];
                   return Column(
                     children: [
                       for(int i = 0; i < friend["message"].length; i++)
                         Messages(friend["message"][i]),
                       SizedBox(height: 100,)
                     ],
                   );
                 }
                ),
              ),
            ),
            SendMessage(messageController , textChatControl.sendMessage),
          ],
        ),
      ),
    );
  }
}
