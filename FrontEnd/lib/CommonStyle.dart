import 'package:flutter/material.dart';

BoxDecoration scaffoldDecoration = const BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xf0493a99),
      Color(0xff493a99),
      Color(0xf82D1F72),
      Color(0xff1F1260),
    ],
  ),
);

 snackBar(text , context) {
   SnackBar snackBar =  SnackBar(
      content: Text(
        text,
        style: TextStyle(fontSize: 18),
      ));
   ScaffoldMessenger.of(context).showSnackBar(snackBar);
}


// "لقد قمت بتسجيل الدخول بنجاح"


