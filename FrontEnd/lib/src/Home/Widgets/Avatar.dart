// ignore_for_file: file_names

import 'package:flutter/material.dart';
class Avatar extends StatelessWidget {
  const Avatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      margin: const EdgeInsets.only(left: 10),
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        image: DecorationImage(image: Image.asset("assets/unknownAvatar.jpg").image),
        borderRadius: const BorderRadius.all( Radius.circular(100)),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xf7D0B0F3),
            Color(0x675A6BC1),
          ],
        ),
      ),
    );
  }
}
