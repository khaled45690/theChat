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
            style: const TextStyle(fontSize: 35, color: Color(0xffC89FEB), fontWeight: FontWeight.w300)),
      ],
    );
  }
}
