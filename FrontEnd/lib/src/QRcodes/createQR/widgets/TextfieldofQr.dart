// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class TextfieldQr extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  const TextfieldQr(this.onChanged);
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
