import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TextfieldQr extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  TextfieldQr(this.onChanged);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * .8,
      child: TextField(
          onChanged:onChanged,

          decoration: InputDecoration(
              hintText: "Generate QR code",
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 2),
              ))),
    );
  }
}
