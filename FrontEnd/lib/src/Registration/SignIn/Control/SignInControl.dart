import 'dart:convert';

import 'package:chat/src/Registration/SignIn/SignIn.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../CommonStyle.dart';
import '../../../../constants/Constants.dart';

class SignInControl {
  var state;
  SignInControl(this.state);
  visibiltyChange() {
    if (state.isHidden) {
      state.setState(() {
        state.isHidden = false;
      });
      return;
    }
    state.setState(() {
      state.isHidden = true;
    });
  }

  onChange(String variableName, String value) {
    state.loginData[variableName] = value;
    state.setState(() {
      state.loginDataError[variableName] = null;
    });
  }

  Navigate(context, destination) {}

  void login() async {
    _check();
    if(_check()) return ;
    var url = Uri.parse("${serverURL}auth/login");
    http.Response response;
    print("entered");
    Map<String, String> bodyData = {
      "email": "kkk@gmail.com",
      "password": "123456"
    };
    try {
      response = await http.post(url, body: jsonEncode(bodyData));
      if (response.statusCode == Status_success) {
        snackBar("لقد قمت بتسجيل الدخول بنجاح" , state.context);
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
