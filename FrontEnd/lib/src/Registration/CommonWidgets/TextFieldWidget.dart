// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class RegistrationTextFieldWidget extends StatelessWidget {
  final TextDirection textDirection;
  final String hint;
  final bool isPassword;

  const RegistrationTextFieldWidget(this.textDirection, this.hint , {this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: MediaQuery.of(context).size.width - 40,
      child: TextField(
          textAlign: TextAlign.left,
          showCursor: true,
          enabled: true,
          textAlignVertical: TextAlignVertical.center,
          obscureText: isPassword,
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              alignLabelWithHint: true,
              hintStyle: const TextStyle(
                color: Colors.black,
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              hintText: hint)),
    );
  }
}
