import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'UserDataModel.dart';
import 'UserData_state.dart';

//here we create a cubit and pass abstract class that in state
class SocketCubit extends Cubit<UserDataState> {

  // pass the initState to super
  SocketCubit() : super(UserDataINitState());



  //create funcation to get object from cubit
  // must be static  to get it
  static SocketCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  // initialize UserData
  UserData userData = UserData();



}
