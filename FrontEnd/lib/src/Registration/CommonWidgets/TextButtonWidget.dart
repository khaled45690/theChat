import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  final String text;
  const TextButtonWidget(this.text);

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
