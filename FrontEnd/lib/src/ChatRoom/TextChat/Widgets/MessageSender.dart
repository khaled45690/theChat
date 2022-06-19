// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'MessageTextField.dart';
import 'SendButton.dart';



class SendMessage extends StatelessWidget {

  const SendMessage();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 13,
      child: Row(
        children: const [
          SendMsg(),
          IconOfMic(),
        ],
      ),
    );
  }
}
