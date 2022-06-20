// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class MessageRoomInfo extends StatelessWidget {
  final Map friend;
  const MessageRoomInfo(this.friend);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            friend["name"],
            style: const TextStyle(
                color: Colors.white60,
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Text(
                friend["message"].length > 0 ? friend["message"][friend["message"].length - 1]["text"] : "",
                style: const TextStyle(
                    color: Colors.black45,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                friend["message"].length > 0 ? friend["message"][friend["message"].length - 1]["date"] : "",
                style: const TextStyle(
                    color: Colors.black45,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ],
          )
        ],
      ),
    );
  }
}
