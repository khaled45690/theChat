// ignore_for_file: file_names, prefer_const_constructors, use_key_in_widget_constructors

import 'package:chat/src/Registration/SignUp/SignUp.dart';
import 'package:flutter/material.dart';

import 'SignIn/SignIn.dart';

class Registration extends StatefulWidget {
  // the RegistrationType variable gets it's value from parent widget to determine
  // if it will the SignIn screen or SignUp screen
  final bool registrationType;
  const Registration(this.registrationType);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    return widget.registrationType ? SignIn() : SignUp();
  }
}

