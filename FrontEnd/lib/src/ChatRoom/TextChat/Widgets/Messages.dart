// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../../../Clippers/MessageClipper.dart';
class Messages extends StatelessWidget {
  final Map messageData;
  const Messages(this.messageData);

  @override
  Widget build(BuildContext context) {
    return messageData["isSender"] ? senderMessage() : receiverMessage();
  }

  Widget receiverMessage() {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: ClipPath(
        clipper: MessageClipper(messageData["isSender"]),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color(0xffC7A0EC),
                Color(0xff1F1260),
              ],
            ),
          ),
          margin: const EdgeInsets.only(top: 5),
          child: messageText(),
        ),
      ),
    );
  }


  Widget senderMessage() {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: ClipPath(
          clipper: MessageClipper(messageData["isSender"]),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xff1F1260),
                  Color(0x4f1F1260),
                  Color(0xffC7A0EC),
                ],
              ),
            ),
            margin: const EdgeInsets.only(top: 5),
            child: messageText(),
          ),
        ),
    );
  }

  Widget messageText(){

    return Container(
        width: 250,
        margin: const EdgeInsets.all(18),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width:190,
                child: Text(messageData["text"],
                    style: const TextStyle(color: Colors.white, fontSize: 18))),
            const SizedBox(width: 5,),
            Text(messageData["date"].toString().substring(10,19),
                style: TextStyle(color: Colors.white, fontSize: 10)),

          ],
        ));
  }

}
