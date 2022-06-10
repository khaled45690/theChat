// this file has all the functions that may change in the future

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'constants/Constants.dart';

navigateTo(BuildContext context , Widget destintaion){
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => destintaion),
  );
}


Future<Response> HttpPost(String api , Map body) async{
  var url = Uri.parse("$serverURL$api");
  return await post(url, body: jsonEncode(body));
}

