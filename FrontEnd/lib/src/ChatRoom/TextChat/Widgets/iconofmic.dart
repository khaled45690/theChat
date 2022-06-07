import 'package:flutter/material.dart';

class IconOfMic extends StatelessWidget {
  const IconOfMic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: 25,
        backgroundColor: Color(0xf7D0B0F3),
        child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.mic,
              color: Colors.amber,
            )));
  }
}
