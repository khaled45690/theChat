// ignore_for_file: file_names

import 'package:flutter/material.dart';

class RecieverViewer extends StatelessWidget {
  const RecieverViewer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Image.asset("assets/Reciever.jpg" , fit: BoxFit.fill),
    );
  }
}
