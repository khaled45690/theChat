import 'package:chat/src/Registration/SignIn/SignIn.dart';
import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const TextButtonWidget(this.text , this.onPressed);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 15,
          color: Color(0xffC89FEB),
        ),
      ),
    );
  }
}
