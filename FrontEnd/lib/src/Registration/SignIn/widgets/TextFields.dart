// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

import '../../CommonWidgets/TextFieldWidget.dart';

class TextFields extends StatelessWidget {
  final Function()? visibiltyChange;
  final Function(String variableName , String value) onChange;
  final bool isHidden;
  final Map loginData , loginDataError;
  const TextFields(this.visibiltyChange , this.onChange ,this.loginData , this.loginDataError, this.isHidden);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Column(
          children: [
            RegistrationTextFieldWidget(TextDirection.ltr, onChange , "email" , loginDataError["email"],"please enter ur email"),
            RegistrationTextFieldWidget(TextDirection.ltr, onChange , "password" , loginDataError["password"],"please enter ur password",
                isPassword: true , visibiltyChange: visibiltyChange, isHidden: isHidden),
          ],
        ));
  }
}
