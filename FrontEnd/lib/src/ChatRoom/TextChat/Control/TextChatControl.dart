// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../businesslogic/UserData/UserBloc.dart';
import '../../../../businesslogic/UserData/UserDataModel.dart';
import '../../../../businesslogic/socket/SocketCubit.dart';
import '../TextChat.dart';

class TextChatControl{
  final TextChatState state ;
  TextChatControl(this.state);
  sendMessage(){
    Map messageMap = {};
    messageMap["text"] = state.messageController.value.text;
    messageMap["Receiver"] = state.widget.friendId;
    messageMap["Sender"] = state.context.read<UserBloc>().state?.id;
    messageMap["date"] = DateTime.now().toString();
    state.context.read<SocketCubit>().socket?.emit("message" , messageMap);
    _sentMessage(messageMap);
    state.messageController.text = "";
  }


  _sentMessage(Map data){
    Map userData = state.context.read<UserBloc>().state!.toMap();
    Map friends = jsonDecode(userData["friends"]!);
    data["isSender"] = true;
    friends[data["Receiver"]]["message"].add(data);
    print(friends);
    userData["friends"] = jsonEncode(friends);
    userData["chatOrder"].remove(data["Receiver"]);
    userData["chatOrder"].add(data["Receiver"]);
    UserData userDataUpdated = UserData();
    userDataUpdated.fromMap(userData);
    state.context.read<UserBloc>().setUserData(userDataUpdated);
  }
}