// ignore_for_file: file_names

import 'package:flutter/material.dart';

class SenderViewer extends StatelessWidget {
  const SenderViewer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: 150,
      height:200,
      child: Image.asset("assets/SenderPic.jpg" , fit: BoxFit.fill),
    );
  }
}
