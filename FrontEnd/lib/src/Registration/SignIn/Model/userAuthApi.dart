import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../../../../constants/statuscode.dart';
import '../../../../serverUrl.dart';

class UsersAuthAPI {
  Future login(String email, String password, BuildContext context) async {
    var url = Uri.parse("${serverURL}auth/login");
    http.Response response;

    Map<String, String> bodyData = {"email": "kkk@gmail.com", "password": "123456"};
    try {
      response = await http.post(url, body: jsonEncode(bodyData));
      if (response.statusCode == Status_success) {
        print(response.body);
        print(response.statusCode);

        final snackBar = SnackBar(
            content: Text(
          "لقد قمت بتسجيل الدخول بنجاح",
          style: TextStyle(fontSize: 18),
        ));
        print("lllllll");
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      final snackBar = SnackBar(
          content: Text(
        e.toString(),
        style: TextStyle(fontSize: 18),
      ));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
