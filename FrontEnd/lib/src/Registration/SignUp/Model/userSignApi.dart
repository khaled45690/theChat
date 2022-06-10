import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../../constants/Constants.dart';

class UserSignupApi {
  signup(String email, String password, String name,int type,BuildContext context) async {
    var url = Uri.parse("${serverURL}auth/signup");
    http.Response response;

    Map<String, dynamic> bodyData = {"email": email, "password": password, "name":name, "type":type};
    try {
      response = await http.post(url, body: jsonEncode(bodyData));
      if (response.statusCode == Status_success) {
        print(response.body);
        print(response.statusCode);

        const snackBar = SnackBar(
            content: Text(
          "لقد قمت بعمل ايمال جديد بنجاح",
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
