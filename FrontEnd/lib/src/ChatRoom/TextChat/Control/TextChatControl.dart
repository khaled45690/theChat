// ignore_for_file: file_names

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../businesslogic/UserData/UserBloc.dart';
import '../../../../businesslogic/socket/SocketCubit.dart';
import '../TextChat.dart';

class TextChatControl{
  final TextChatState state ;
  TextChatControl(this.state);
  sendMessage(){
    Map message = {};
    message["text"] = state.messageController.value.text;
    message["Receiver"] = state.widget.friendId;
    message["Sender"] = state.context.read<UserBloc>().state?.id;
    message["date"] = DateTime.now().toString();
    state.context.read<SocketCubit>().socket?.emit("message" , message);
    state.messageController.text = "";
  }
}