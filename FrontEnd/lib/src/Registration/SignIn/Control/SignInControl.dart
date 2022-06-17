import 'dart:convert';

import 'package:chat/src/Registration/SignUp/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

import '../../../../CommonStyle.dart';
import '../../../../DependentPlugins.dart';
import '../../../../businesslogic/UserData/UserDataModel.dart';
import '../../../../businesslogic/UserData/UserCubit.dart';
import '../../../../constants/Constants.dart';
import '../../../Home/Home.dart';

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
    navigateTo(state.context, const SignUp());
  }

  void login(BuildContext context) async {
    _removeUnwantedWhiteSpaces();
    if (_check()) return;

    Response response = await HttpPost("auth/login",state.loginData);
    Map responseData = jsonDecode(response.body);
    print(responseData);
    if(response.statusCode == Status_success){
      UserData userData = UserData();
      userData.fromMap(responseData["userData"]);
      context.read<UserCubit>().setUserData(userData);
      navigateTo(state.context , const Home());
    }else{
      snackBar(responseData["message"] , context);
    }
  }

  bool _check() {
    bool check = false;
    state.loginData.keys.forEach((key) => {
          if (state.loginData[key] == null)
            {
              state.setState(() {
                check = true;
                state.loginDataError[key] = "this field is required";
              })
            }
        });
    return check;
  }

  _removeUnwantedWhiteSpaces(){
    state.loginData["email"] = state.loginData["email"].replaceAll(' ', '');
    state.loginData["password"] = state.loginData["password"].replaceAll(' ', '');
  }
}
