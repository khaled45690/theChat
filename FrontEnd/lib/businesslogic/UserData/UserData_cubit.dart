import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'UserDataModel.dart';
import 'UserData_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

//here we create a cubit and pass abstract class that in state
class UserDataCubit extends Cubit<UserDataState> {

  // pass the initState to super
  UserDataCubit() : super(UserDataINitState());



  //create funcation to get object from cubit
  // must be static  to get it
  static UserDataCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }
  late Future<SharedPreferences> _prefs =  SharedPreferences.getInstance();

  // initialize UserData
  UserData _userData = UserData();

  UserData getUserData(){
    return _userData;
  }

  setUserData(UserData userData)async{
    SharedPreferences prefs = await _prefs;
    _userData = userData;
    prefs.setString("UserData" , jsonEncode(_userData.toMap()));
  }

  Future<UserData> getUserDataFromPref()async{
    SharedPreferences prefs = await _prefs;
    Map data = jsonDecode(prefs.getString("UserData")!);
    _userData.fromMap(data);
    return _userData;
  }


}
