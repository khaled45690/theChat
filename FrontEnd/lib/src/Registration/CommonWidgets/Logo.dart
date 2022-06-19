// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
class Logo extends StatelessWidget {
  final String text;
   const Logo(this.text);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        Image.asset(
          "assets/ChatLogo.png",
          width: 150,
        ),
        Text( text,
            style: const TextStyle(fontSize: 35, fontWeight: FontWeight.w300)),
      ],
    );
  }
}
