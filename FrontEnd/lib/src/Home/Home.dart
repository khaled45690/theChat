import 'package:flutter/material.dart';

import '../../CommonStyle.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        width: 60,
        height: 60,
        margin: EdgeInsets.all(0),
        padding: EdgeInsets.zero,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xf7D0B0F3),
              Color(0x675A6BC1),
            ],
          ),
        ),
        child: MaterialButton(
          splashColor: Colors.deepPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(200.0),
          ),
          height: 60,
          onPressed: () {},
          child: Icon(Icons.add , size: 30),
        ),
      ),
      body: Container(
        decoration: scaffoldDecoration,
      ),
    );
  }
}
