import 'package:flutter/material.dart';

import '../CommonWidgets/TextFieldWidget.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xf0493a99),
            Color(0xff493a99),
            Color(0xf82D1F72),
            Color(0xff1F1260),
          ],
        ),
      ),
          child: Column(
            children: [
              const SizedBox(height: 40,),
              Image.asset("assets/ChatLogo.png" , width: 150,),
              const Text("Sign in" , style: TextStyle(fontSize: 35  , color: Colors.white)),
              const RegistrationTextFieldWidget(TextDirection.ltr , "enter ur email" ),
              const RegistrationTextFieldWidget(TextDirection.ltr , "password" , isPassword: true),
            ],
          ),
    ));
  }
}
