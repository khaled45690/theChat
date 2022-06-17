import 'package:chat/businesslogic/UserData/UserDataModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../UserData/UserCubit.dart';

addFriend(BuildContext context , Map data){
  print(data);
  UserData userData = UserData();
  userData.fromMap(data);
  context.read<UserCubit>().setUserData(userData);
}