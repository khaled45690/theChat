// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'MessageTextField.dart';
import 'SendButton.dart';



class SendMessage extends StatelessWidget {
  final Function() sendMessage;
  final TextEditingController messageController;
  const SendMessage(this.messageController , this.sendMessage);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 13,
      child: Row(
        children: [
          ChatTextField(messageController),
          SendButton(sendMessage),
        ],
      ),
    );
  }
}
