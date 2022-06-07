import 'package:flutter/material.dart';

import 'MessageTextField.dart';
import 'SendButton.dart';



class SendMessage extends StatelessWidget {

  SendMessage();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 13,
      child: Row(
        children: [
          SendMsg(),
          IconOfMic(),
        ],
      ),
    );
  }
}
