// ignore_for_file: file_names, prefer_const_constructors

import 'package:chat/src/Registration/CommonWidgets/TextFieldWidget.dart';
import 'package:flutter/material.dart';

import '../../CommonStyle.dart';
import '../Registration/CommonWidgets/RegistrationButton.dart';
import 'Control/EditControl.dart';
import 'Widgets/CircleAvatarImage.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late EditControl editControl; //
  // EditControl editData = EditControl();
  @override
  void initState() {
    super.initState();
    editControl = EditControl(this);
  }

  Map x = {};
  String y = '';
  String c = "";

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
          Container(
            margin: EdgeInsets.only(bottom: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 250,),
                CircleAvataroFPAGE(),
                const SizedBox(height: 50,),
                RegistrationTextFieldWidget(TextDirection.ltr, (y,c){}, "name", c, "please enter your name"),
                 SizedBox(height: (MediaQuery.of(context).size.height / 5.5)),
                RegistrationButton("update profile ", editControl.editprofile),
              ],
            ),
          ),
         
          ],
        ),
      ),
    ));
  }
}
