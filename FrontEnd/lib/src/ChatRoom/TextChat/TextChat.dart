import 'package:flutter/material.dart';

import '../../../CommonStyle.dart';
import 'Widgets/Messages.dart';
import 'Widgets/TextChatAppBar.dart';

class TextChat extends StatefulWidget {
  const TextChat({Key? key}) : super(key: key);

  @override
  State<TextChat> createState() => _TextChatState();
}

class _TextChatState extends State<TextChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const TextChatAppBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: scaffoldDecoration,
        padding: EdgeInsets.only(top: 100),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: const [
                  Messages(true),
                  Messages(false),
                  Messages(true),
                  Messages(false),
                  Messages(true),
                  Messages(false),
                  Messages(true),
                  Messages(false),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
