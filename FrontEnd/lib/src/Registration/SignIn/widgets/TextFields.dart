import 'package:flutter/material.dart';

import '../../CommonWidgets/TextFieldWidget.dart';

class TextFields extends StatelessWidget {
  final Function()? visibiltyChange;
  final Function(String variableName , String value) onChange;
  final bool isHidden;
  const TextFields(this.visibiltyChange , this.onChange , this.isHidden);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Column(
          children: [
            RegistrationTextFieldWidget(TextDirection.ltr, onChange , "userName" , "please enter ur email"),
            RegistrationTextFieldWidget(TextDirection.ltr, onChange , "password" ,"please enter ur password",
                isPassword: true , visibiltyChange: visibiltyChange, isHidden: isHidden),
          ],
        ));
  }
}
