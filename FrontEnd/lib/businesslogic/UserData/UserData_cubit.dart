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
  SharedPreferences? prefs;

  // initialize UserData
  Map userDataMap = UserData().toMap();
  UserData _userData = UserData();

  UserData getUserData(){
    return _userData;
  }

  setUserData(UserData userData)async{
    SharedPreferences prefs = await _prefs;
    _userData = userData;
    userDataMap = _userData.toMap();
    prefs.setString("UserData" , jsonEncode(userDataMap));
  }
 setPrefs()async{
    prefs = await _prefs;
}
  UserData? getUserDataFromPref(){
    print("entered");
    String? userDataString = prefs?.getString("UserData");
    if(userDataString == null) return null;

    Map data = jsonDecode(prefs!.getString("UserData")!);
    userDataMap = data;
    _userData.fromMap(data);
    return _userData;
  }


}
