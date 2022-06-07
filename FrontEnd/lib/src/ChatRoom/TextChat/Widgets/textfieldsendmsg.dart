import 'package:flutter/material.dart';

import 'iconofmic.dart';
import 'sendmsg.dart';

class SendMessage extends StatelessWidget {
  final VoidCallback expand;
  SendMessage(this.expand);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 13,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconOfMic(),
          SendMsg(() {
            expand();
          })
        ],
      ),
    );
  }
}
