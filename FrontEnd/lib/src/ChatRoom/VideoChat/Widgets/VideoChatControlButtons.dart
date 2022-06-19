// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'VideoChatButton.dart';

class VideoChatControlButtons extends StatelessWidget {
  const VideoChatControlButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child:  Container(
        width: MediaQuery.of(context).size.width,
        height: 80,
        color: Colors.black45.withOpacity(0.7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            VideoChatButton(FontAwesomeIcons.cameraRotate),
            VideoChatButton(FontAwesomeIcons.phoneSlash)
          ],
        ),
      ),);
  }
}
