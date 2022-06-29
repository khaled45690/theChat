// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../../DependentPlugins.dart';

class EditControl {
  final state;
  EditControl(this.state);
  visibilityChange() {
    state.setState(() {
      state.isHidden = !state.isHidden;
    });
  }

  onChange(String variableName, String value) {
    state.loginData[variableName] = value;
    state.setState(() {
      state.loginDataError[variableName] = null;
    });
  }

  void editprofile(BuildContext context) async {
 

    Response response = await HttpPost("edit/edituser",state.loginData);
   
  }

}
