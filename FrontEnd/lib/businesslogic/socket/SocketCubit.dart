// ignore_for_file: file_names, library_prefixes, unnecessary_string_interpolations

import 'package:chat/businesslogic/socket/socketFunctions/addFriend.dart';
import 'package:chat/businesslogic/socket/socketFunctions/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../constants/Constants.dart';

//here we create a cubit and pass abstract class that in state
class SocketCubit extends Cubit<IO.Socket?> {

  // pass the initState to super
  SocketCubit() : super(null);



  //create funcation to get object from cubit
  // must be static  to get it
  static SocketCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  BuildContext? context;
  // initialize the socket
  IO.Socket? _socket;

  // for accessing the socket
  IO.Socket? get socket => _socket;

  // fucation to connect to server
  void connect() {
    _socket = IO.io("$serverURL", <String, dynamic>{
      "transports": ["websocket"],
      //it's better to make it false and connect to server manually
      "autoConnect": false,
    });

    //connect to server
    _socket!.connect();

    // in case of connect print "tnen tnen asa7by we mesh 73'ayarha"
    _socket!.onConnect((data) {

    });
    socket?.on("addFriend", (data) => addFriend(context! , data));
    socket?.on("message", (data) => receivedMessage(context! , data));
    socket!.emit("/test", "hello");
    //
  }

  setContext(BuildContext context){
    this.context = context;
  }
}
