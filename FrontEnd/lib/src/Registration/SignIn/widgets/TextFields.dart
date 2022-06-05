import 'package:flutter/material.dart';

import '../../CommonWidgets/TextFieldWidget.dart';

class TextFields extends StatelessWidget {
  final Function()? visibiltyChange;
  final bool isHidden;
  const TextFields(this.visibiltyChange , this.isHidden);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Column(
          children: [
            const RegistrationTextFieldWidget(TextDirection.ltr, "please enter ur email"),
            RegistrationTextFieldWidget(TextDirection.ltr, "please enter ur password",
                isPassword: true , visibiltyChange: visibiltyChange, isHidden: isHidden),
          ],
        ));
  }
}
