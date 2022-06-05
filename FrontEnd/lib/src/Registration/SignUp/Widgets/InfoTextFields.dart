import 'package:flutter/material.dart';

import '../../CommonWidgets/TextFieldWidget.dart';

class InfoTextFields extends StatelessWidget {
  const InfoTextFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 30),
        child: Column(
          children: const [
            RegistrationTextFieldWidget(TextDirection.ltr, "please enter ur email"),
            RegistrationTextFieldWidget(TextDirection.ltr, "please enter ur name"),
            RegistrationTextFieldWidget(TextDirection.ltr, "please enter ur password",
                isPassword: true),
            RegistrationTextFieldWidget(TextDirection.ltr, "please re enter ur password",
                isPassword: true),
          ],
        ));
  }
}
