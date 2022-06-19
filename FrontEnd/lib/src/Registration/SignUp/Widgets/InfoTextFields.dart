// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../../CommonWidgets/TextFieldWidget.dart';

class InfoTextFields extends StatelessWidget {
  final Function(String variableName, String value) onChange;
  final Function(String variableName) visibiltyChange;
  final Map signUpData, signUpDataError;
  final Map<String, bool> isHidden;
  const InfoTextFields(this.onChange, this.signUpData, this.signUpDataError,
      this.isHidden, this.visibiltyChange);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 30),
        child: Column(
          children: [
            RegistrationTextFieldWidget(TextDirection.ltr, onChange, "name",
                signUpDataError["name"], "please enter ur name"),
            RegistrationTextFieldWidget(TextDirection.ltr, onChange, "email",
                signUpDataError["email"], "please enter ur email"),
            RegistrationTextFieldWidget(TextDirection.ltr, onChange, "password",
                signUpDataError["password"], "please enter ur password",
                isPassword: true,
                isHidden: isHidden["password"]!,
                visibiltyChange: () => visibiltyChange("password")),
            RegistrationTextFieldWidget(
                TextDirection.ltr,
                onChange,
                "confirmPassword",
                signUpDataError["confirmPassword"],
                "please re-enter ur password",
                isPassword: true,
                visibiltyChange: ()=> visibiltyChange("confirmPassword"),
                isHidden: isHidden["confirmPassword"]!),
          ],
        ));
  }
}
