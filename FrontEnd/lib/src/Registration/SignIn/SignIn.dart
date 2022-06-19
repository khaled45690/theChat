// ignore_for_file: file_names

import 'package:chat/src/Registration/SignIn/Control/SignInControl.dart';
import 'package:chat/src/Registration/SignIn/widgets/TextFields.dart';
import 'package:flutter/material.dart';

import '../../../CommonStyle.dart';
import '../CommonWidgets/Logo.dart';
import '../CommonWidgets/RegistrationButton.dart';
import '../CommonWidgets/TextButtonWidget.dart';
import 'Model/SignInModel.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // Declaring and initializing variables Section//////////////////
  late SignInControl signInControl;                              //
  SignInModel signInData = SignInModel();                        //
  bool isHidden = true;                                          //
  Map loginData = SignInModel().toMap() , loginDataError = {};   //
  //  End section of Declaring and initializing variables//////////



  @override
  void initState() {
    super.initState();
    signInControl = SignInControl(this);

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: scaffoldDecoration,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Logo("Sign In"),
            TextFields(signInControl.visibilityChange, signInControl.onChange,
                loginData , loginDataError, isHidden),
            SizedBox(height: (MediaQuery.of(context).size.height / 5.5)),
            RegistrationButton(
                "Sign in", signInControl.login),
            const SizedBox(height: 30),
            TextButtonWidget(
                "Don't have account then sign up", signInControl.Navigate),
          ],
        ),
      ),
    ));
  }
}
