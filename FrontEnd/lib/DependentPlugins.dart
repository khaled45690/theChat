// this file has all the functions that may change in the future

// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'constants/Constants.dart';

navigateTo(BuildContext context ,destintaion){

  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => destintaion),
  );
}


Future<Response> HttpPost(String api , Map body) async{
  var url = Uri.parse("$serverURL$api");
  return await post(url,   headers: {"Content-Type": "application/json"},  body: jsonEncode(body));
}

