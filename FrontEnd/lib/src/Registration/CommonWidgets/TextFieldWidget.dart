// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegistrationTextFieldWidget extends StatelessWidget {
  final TextDirection textDirection;
  final String hint , variableName;
  final bool isPassword , isHidden;
  final String? errorText;
  final Function()? visibiltyChange;
  final Function(String variableName , String value) onChange;

  const RegistrationTextFieldWidget(this.textDirection, this.onChange , this.variableName, this.errorText, this.hint , {this.isPassword = false , this.isHidden = true , this.visibiltyChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: MediaQuery.of(context).size.width - 40,
      child: TextField(
        onChanged: (value)=> onChange(variableName , value),
          textAlign: TextAlign.left,
          showCursor: true,
          enabled: true,
          textAlignVertical: TextAlignVertical.center,
          obscureText: isPassword ? isHidden ? true : false : false,
          decoration: InputDecoration(
              suffixIcon: isPassword ? IconButton(icon: isHidden ? const Icon(FontAwesomeIcons.eyeSlash) : const Icon(FontAwesomeIcons.eye), onPressed: visibiltyChange,) : null,
              filled: true,
              fillColor: Colors.white,
              alignLabelWithHint: true,
              hintStyle: const TextStyle(
                color: Colors.grey,
              ),
              errorText: errorText,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              hintText: hint)),
    );
  }
}
