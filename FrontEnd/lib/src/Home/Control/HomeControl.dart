// ignore_for_file: file_names, prefer_typing_uninitialized_variables, use_build_context_synchronously

import 'package:chat/businesslogic/UserData/UserBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scan/scan.dart';
import '../../../CommonStyle.dart';
import '../../../businesslogic/socket/SocketCubit.dart';
class HomeControl{
  final state;
  HomeControl(this.state);
  addFriend(){
    return showDialog(
        context: state.context,
        builder: (BuildContext context1) {
          return  AlertDialog(
            backgroundColor: Colors.deepPurple,
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(onPressed: ()=>_cameraScanner(state.context), icon: const Icon(FontAwesomeIcons.camera) , color: Colors.deepPurple.shade900, splashColor: Colors.deepPurple.shade700),
                IconButton(onPressed:  ()=> _imageScanner(state.context), icon: const Icon(FontAwesomeIcons.images) , color: Colors.deepPurple.shade900, splashColor: Colors.deepPurple.shade700,)
              ],
            ),
          );
        }
    );
  }



 _cameraScanner(BuildContext context) {
    try {
      Navigator.of(context).pop();
      FlutterBarcodeScanner.scanBarcode("#2A99CF", "cancel", true, ScanMode.QR)
          .then(((value) async {

            if(value != "-1"){
              Map  postData = {
                "userId" : context.read<UserBloc>().getUserData().id,
                "friendId" : value,
              };
              context.read<SocketCubit>().setContext(context);
              context.read<SocketCubit>().socket?.emit("addFriend" ,postData );
            }
      }),);
    } catch (e) {
      snackBar(context , e.toString());
    }
  }


  _imageScanner(BuildContext context) async {
    Navigator.of(state.context).pop();
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? pickedFile = await picker.pickImage(
          source: ImageSource.gallery,
          imageQuality: 100
      );
      String? friendId = await Scan.parse(pickedFile!.path);



      if(friendId != null) _sendAddFriend(context , friendId);
    }catch(e){
      snackBar(context , e.toString());
    }
  }

  _sendAddFriend(BuildContext context, String friendId){
    Map  postData = {
      "userId" : context.read<UserBloc>().getUserData().id,
      "friendId" : friendId,
    };
    context.read<SocketCubit>().setContext(context);
    context.read<SocketCubit>().socket?.emit("addFriend" ,postData );
  }
}
