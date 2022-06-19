// ignore_for_file: file_names, use_key_in_widget_constructors

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PickImage extends StatelessWidget {
  final Function() onTap;
  final String? imageName;
  const PickImage(this.onTap , this.imageName);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.deepPurpleAccent,
            backgroundImage: imageName == null ? Image.asset("assets/unknownAvatar.jpg").image : Image.file(File(imageName!)).image,
          ),
          Positioned(
            right: 0,
            bottom: 5,
            child: Icon(FontAwesomeIcons.camera,
                color: Colors.deepPurpleAccent.withOpacity(0.85)),
          )
        ],
      ),
    );
  }
}
