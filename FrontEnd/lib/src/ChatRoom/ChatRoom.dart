// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'TextChat/TextChat.dart';


class ChatRoom extends StatelessWidget {
  final Map friend;
  final String friendId;
  const ChatRoom(this.friend , this.friendId);
  @override
  Widget build(BuildContext context) {
    return TextChat(friend , friendId);
  }
}


