import 'package:bloc/bloc.dart';
import 'package:chat/businesslogic/socket/socket_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../constants/Constants.dart';

//here we create a cubit and pass abstract class that in state
class SocketCubit extends Cubit<SocketStates> {
  // pass the initState to super
  SocketCubit() : super(SocketINitState());

  //create funcation to get object from cubit
  // must be static  to get it
  static SocketCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  // initialize the socket
  IO.Socket? _socket;

  // for accessing the socket
  IO.Socket? get socket => _socket;

  // fucation to connect to server
  void connect() {
    _socket = IO.io("http://192.168.1.7:3050", <String, dynamic>{
      "transports": ["websocket"],
      //it's better to make it false and connect to server manually
      "autoConnect": false,
    });
    //  print("Connected");

    
    //connect to server
    _socket!.connect();


    // in case of connect
    _socket!.onConnect((data) {
      print("Connectedd");
    });
    print(socket!.connected);
    socket!.emit("/test", "hello");

    emit(SocketConnect());
  }
}
