// ignore_for_file: file_names

import 'package:chat/businesslogic/UserData/UserBloc.dart';
import 'package:chat/businesslogic/UserData/UserDataModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


addFriend(BuildContext context , Map data){
  UserData userData = UserData();
  userData.fromMap(data);
  context.read<UserBloc>().setUserData(userData);
}