// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FloatingButton extends StatelessWidget {
  final Function() onPress;
  const FloatingButton(this.onPress);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      margin: const EdgeInsets.all(0),
      padding: EdgeInsets.zero,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(100)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xf7D0B0F3),
            Color(0x675A6BC1),
          ],
        ),
      ),
      child: MaterialButton(
        splashColor: Colors.deepPurple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(200.0),
        ),
        height: 60,
        onPressed: onPress,
        child: Icon(FontAwesomeIcons.plus , size: 30 , color: Colors.deepPurple.shade700),
      ),
    );
  }
}
