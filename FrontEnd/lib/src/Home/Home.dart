import 'package:flutter/material.dart';

import '../../CommonStyle.dart';
import 'Widgets/HomeAppBar.dart';
import 'Widgets/FloatingButton.dart';
import 'Widgets/MessageRoomsLayout.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: Container(),
      appBar: const HomeAppBar(),
      floatingActionButton: const FloatingButton(),
      body: Container(
        decoration: scaffoldDecoration,
        child: Column(
          children: const [
            SizedBox(height: 100,),
            MessageRoomsLayout(),
            MessageRoomsLayout(),
            MessageRoomsLayout(),
            MessageRoomsLayout(),
            MessageRoomsLayout(),
          ],
        ),
      ),
    );
  }
}
