import 'package:flutter/material.dart';

import 'iconofmic.dart';
import 'sendmsg.dart';

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
