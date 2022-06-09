// this file has all the functions that may change in the future

import 'package:flutter/material.dart';

navigateTo(BuildContext context , Widget destintaion){
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => destintaion),
  );
}

