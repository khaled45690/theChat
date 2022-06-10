import 'package:flutter/material.dart';

import '../../../CommonStyle.dart';
import '../CommonWidgets/Logo.dart';
import '../CommonWidgets/RegistrationButton.dart';
import '../CommonWidgets/TextButtonWidget.dart';
import '../SignIn/widgets/TextFields.dart';
import 'Control/SignUpControl.dart';
import 'Model/SignUpModel.dart';
import 'Model/userSignApi.dart';
import 'Widgets/InfoTextFields.dart';
import 'Widgets/PickImage.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // Declaring and initializing variables Section//////////////////////////////////
  late SignUpControl signUpControl;                                              //
  Map<String,bool> isHidden = {"password" : true , "confirmPassword" : true};    //
  Map signUpData = SignUpModel().toMap() , signUpDataError = {};                 //
  //  End section of Declaring and initializing variables/////////////////////////



  void initState() {
    signUpControl = SignUpControl(this);
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: scaffoldDecoration,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Logo("Sign up"),
                // TextFields(signUpControl.visibiltyChange , signUpControl.onChange , isHidden),
                // SizedBox(height: (MediaQuery.of(context).size.height / 20)),
                PickImage(signUpControl.pickImage , signUpData["imageName"]),
                signUpDataError["imageName"] == null ? Container() : const Text("please pick image to continue" , style: TextStyle(color: Colors.red),),
                InfoTextFields(signUpControl.onChange , signUpData , signUpDataError , isHidden , signUpControl.visibiltyChange),
                RegistrationButton("Sign up" , signUpControl.signup),
                const SizedBox(height: 20),
                TextButtonWidget("Already have account sign in instead" , signUpControl.navigateToSignIn),
              ],
            ),
          ),
        ));
  }
}
