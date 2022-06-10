import 'dart:convert';

import 'package:chat/src/Registration/SignIn/SignIn.dart';
import 'package:chat/src/Registration/SignUp/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../CommonStyle.dart';
import '../../../../DependentPlugins.dart';
import '../../../../constants/Constants.dart';

class SignInControl {
  var state;
  SignInControl(this.state);
  visibiltyChange() {
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

  Navigate() {
    Navigator.of(state.context).pop();
    navigateTo(state.context , const SignUp());
  }

  void login() async {
    if(_check()) return ;
    var url = Uri.parse("${serverURL}auth/login");
    http.Response response;
    print("entered");
    Map<String, String> bodyData = {
      "email": "ali@gmail.com",
      "password": "12345556"
    };
    try {
      response = await http.post(url, body: jsonEncode(bodyData));
      if (response.statusCode == Status_success) {
        snackBar("لقد قمت بتسجيل الدخول بنجاح" , state.context);
        print(response.body);
      }
    } catch (e) {
      snackBar(e.toString(), state.context);
    }
  }

  bool _check() {

    bool check  = false;
    state.loginData.keys.forEach((key) => {
      if(state.loginData[key] == null){
        state.setState(() {
          check = true ;
          state.loginDataError[key] = "this field is required";
    })
      }
    });
    return check;
  }
}
