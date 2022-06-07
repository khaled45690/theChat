import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Widgets/RecieverViewer.dart';
import 'Widgets/SenderViewer.dart';
import 'Widgets/VideoChatButton.dart';
import 'Widgets/VideoChatControlButtons.dart';
class VideoChat extends StatefulWidget {
  const VideoChat({Key? key}) : super(key: key);

  @override
  State<VideoChat> createState() => _VideoChatState();
}

class _VideoChatState extends State<VideoChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          RecieverViewer(),
          SenderViewer(),
          VideoChatControlButtons(),
        ],

      ),
    );
  }
}
