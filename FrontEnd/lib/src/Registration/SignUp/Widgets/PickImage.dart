import 'package:flutter/material.dart';

class PickImage extends StatelessWidget {
  const PickImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:  [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.deepPurpleAccent,
          backgroundImage: Image.asset("assets/unknownAvatar.jpg").image,
        ),
        Positioned(child: const Icon(Icons.add_a_photo_outlined , color: Colors.white70,) , right: 0, bottom: 5,)
      ],
    );
  }
}
