import 'package:chat/src/Registration/SignIn/widgets/TextFields.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../CommonStyle.dart';
import '../CommonWidgets/Logo.dart';
import '../CommonWidgets/RegistrationButton.dart';
import '../CommonWidgets/TextButtonWidget.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isHidden = false;
  visibiltyChange(){
    if(isHidden){
      setState(() { isHidden = false; });
      return ;
    }
    setState(() { isHidden = true; });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      decoration: scaffoldDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Logo("Sign in"),
          TextFields(visibiltyChange , isHidden),
          const TextButtonWidget("Forget password?"),
          SizedBox(height: (MediaQuery.of(context).size.height / 5.5)),
          const RegistrationButton("Sign in"),
          const SizedBox(height: 30),
          const TextButtonWidget("Don't have account then sign up"),
          ],
      ),
    ));

  }


}
