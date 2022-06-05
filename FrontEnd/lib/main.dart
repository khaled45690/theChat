import 'package:chat/src/Home/Home.dart';
import 'package:chat/src/Registration/Registration.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Chat());
}

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const Home(),
    );
  }
}