import 'package:chat/src/Registration/SignUp/SignUp.dart';
import 'package:flutter/material.dart';

import 'SignIn/SignIn.dart';

class Registration extends StatefulWidget {
  // the RegistrationType variable gets it's value from parent widget to determine
  // if it will the SignIn screen or SignUp screen
  final bool RegistrationType;
  const Registration(this.RegistrationType);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    return widget.RegistrationType ? SignIn() : SignUp();
  }
}

