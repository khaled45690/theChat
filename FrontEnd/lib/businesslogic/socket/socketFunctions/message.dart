// ignore_for_file: file_names

import 'dart:convert';

import 'package:chat/businesslogic/UserData/UserDataModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../UserData/UserBloc.dart';


message(BuildContext context , Map data){
  UserData userData = context.read<UserBloc>().state!;
  Map friends = jsonDecode(userData.friends!);
  data["isSender"] = false;
  friends[data["Sender"]]["message"].add(data);
  print(friends);
  userData.friends = jsonEncode(friends);
  context.read<UserBloc>().setUserData(userData);
  // userData.fromMap(data);
  // context.read<UserBloc>().setUserData(userData);
}