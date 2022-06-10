import 'package:flutter/material.dart';

import '../../../CommonStyle.dart';
import '../CommonWidgets/Logo.dart';
import '../CommonWidgets/RegistrationButton.dart';
import '../CommonWidgets/TextButtonWidget.dart';
import '../SignIn/widgets/TextFields.dart';
import 'Model/SignUpControl.dart';
import 'Model/userSignApi.dart';
import 'Widgets/InfoTextFields.dart';
import 'Widgets/PickImage.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late SignUpControl signUpControl;
  bool isHidden = true;
  void initState() {
    signUpControl = SignUpControl(this);
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
              Logo("Sign up"),
              // TextFields(signUpControl.visibiltyChange , signUpControl.onChange , isHidden),
              // SizedBox(height: (MediaQuery.of(context).size.height / 5.5)),
              PickImage(),
              InfoTextFields(),
              RegistrationButton("Sign up" , UserSignupApi().signup("ali@gmail.com", "12345556", "ali", 1,context)),
              SizedBox(height: 30),
              TextButtonWidget("Already have account sign in instead" , signUpControl.navigateToSignIn),
            ],
          ),
        ));
  }
}
