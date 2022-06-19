// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class VideoChatButton extends StatelessWidget {
  final IconData icon;
  const VideoChatButton(this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.deepPurpleAccent.withOpacity(0.6),
      ),
      child: Icon(icon),
    );
  }
}
