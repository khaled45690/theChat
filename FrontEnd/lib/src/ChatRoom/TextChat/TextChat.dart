import 'package:flutter/material.dart';

import '../../../CommonStyle.dart';
import 'Widgets/Messages.dart';
import 'Widgets/TextChatAppBar.dart';
import 'Widgets/textfieldsendmsg.dart';

class TextChat extends StatefulWidget {
  const TextChat({Key? key}) : super(key: key);

  @override
  State<TextChat> createState() => _TextChatState();
}

class _TextChatState extends State<TextChat> {
  ScrollController scrollController = ScrollController();
  bool expand = true;

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

            Container(
              height:MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                controller: scrollController,
                scrollDirection: Axis.vertical,
                child: Column(
                  children: const [
                    Messages(true),
                    Messages(false),
                    Messages(false),
                    Messages(false),
                    Messages(false),
                    Messages(false),
                    Messages(true),
                    SizedBox(height: 100,)
                  ],
                ),
              ),
            ),
            SendMessage(),
          ],
        ),
      ),
    );
  }
}
