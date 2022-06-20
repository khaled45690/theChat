// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SendButton extends StatelessWidget {
  final Function() sendMessage;
  const SendButton(this.sendMessage , {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: 25,
        backgroundColor: Color(0xf7D0B0F3),
        child: IconButton(
            onPressed: sendMessage,
            icon: const Icon(
              FontAwesomeIcons.arrowRight , color: Colors.deepPurpleAccent,
            )));
  }
}
