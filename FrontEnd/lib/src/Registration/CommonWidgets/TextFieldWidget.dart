// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class RegistrationTextFieldWidget extends StatelessWidget {
  final TextDirection textDirection;
  final String hint;
  final bool isPassword , isHidden;
  final Function()? visibiltyChange;

  const RegistrationTextFieldWidget(this.textDirection, this.hint , {this.isPassword = false , this.isHidden = true , this.visibiltyChange});

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
          obscureText: isPassword ? isHidden ? true : false : false,
          decoration: InputDecoration(
              suffixIcon: isPassword ? IconButton(icon: isHidden ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off), onPressed: visibiltyChange,) : null,
              filled: true,
              fillColor: Colors.white,
              alignLabelWithHint: true,
              hintStyle: const TextStyle(
                color: Colors.grey,
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              hintText: hint)),
    );
  }
}
