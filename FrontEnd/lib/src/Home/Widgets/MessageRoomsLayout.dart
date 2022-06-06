import 'package:flutter/material.dart';

import '../../ChatRoom/ChatRoom.dart';
import 'Avatar.dart';
import 'MessageRoomInfo.dart';
class MessageRoomsLayout extends StatelessWidget {
  const MessageRoomsLayout({Key? key}) : super(key: key);

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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ChatRoom()),
          );
        },
        child: Row(
          children: const [
            Avatar(),
            MessageRoomInfo()
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