// ignore_for_file: file_names

import 'dart:convert';

import 'package:chat/businesslogic/UserData/UserDataModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../UserData/UserBloc.dart';


receivedMessage(BuildContext context , Map data ){
  Map userData = context.read<UserBloc>().state!.toMap();
  Map friends = jsonDecode(userData["friends"]!);
  data["isSender"] = false;
  friends[data["Sender"]]["message"].add(data);
  print(friends);
  userData["friends"] = jsonEncode(friends);
  userData["chatOrder"].remove(data["Sender"]);
  userData["chatOrder"].add(data["Sender"]);
  UserData userDataUpdated = UserData();
  userDataUpdated.fromMap(userData);
  context.read<UserBloc>().setUserData(userDataUpdated);
}