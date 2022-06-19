// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'Widgets/RecieverViewer.dart';
import 'Widgets/SenderViewer.dart';
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
