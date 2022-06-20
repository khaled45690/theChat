// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../DependentPlugins.dart';
import '../../ChatRoom/ChatRoom.dart';
import 'Avatar.dart';
import 'MessageRoomInfo.dart';
class MessageRoomsLayout extends StatelessWidget {
  final Map friend;
  final String friendId;
  const MessageRoomsLayout(this.friend , this.friendId);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5 , right: 5 , bottom: 15),
      decoration: boxDecoration,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        splashColor: Colors.deepPurpleAccent.shade400.withOpacity(0.2),
        padding:  const EdgeInsets.only(top: 5 , bottom: 5),
        onPressed: (){
          navigateTo(context , ChatRoom(friend , friendId));
        },
        child: Row(
          children: [
            Avatar(friend["imageName"]),
            MessageRoomInfo(friend)
          ],
        ),
      ),
    );
  }
}








BoxDecoration boxDecoration =  const BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(10)),
  gradient: LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color(0xf7D0B0F3),
      Color(0x675A6BC1),
    ],
  ),
);