// ignore_for_file: file_names, invalid_use_of_visible_for_testing_member

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'UserDataModel.dart';
import 'UserData_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

                    //BlocStateListener  BlocStateType
class UserBloc extends Bloc<UserDataState , UserData?> {

  // pass the initial value with super
  UserBloc() : super(null);



  //create funcation to get object from cubit
  // must be static  to get it
  static UserBloc get(BuildContext context) {
    return BlocProvider.of(context);
  }
  late final Future<SharedPreferences> _prefs =  SharedPreferences.getInstance();
  SharedPreferences? prefs;

  // initialize UserData
  UserData _userData = UserData();

  UserData getUserData(){
    return _userData;
  }

  setUserData(UserData userData)async{
    SharedPreferences prefs = await _prefs;
    _userData = userData;
    prefs.setString("UserData" , jsonEncode(_userData.toMap()));
    emit(_userData);
  }
 setPrefs()async{
    prefs = await _prefs;
}
  UserData? getUserDataFromPref(){
    String? userDataString = prefs?.getString("UserData");
    if(userDataString == null) return null;
    Map data = jsonDecode(prefs!.getString("UserData")!);
    _userData.fromMap(data);
    emit(_userData);
    return _userData;
  }


}
