import 'package:chat/businesslogic/UserData/UserData_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scan/scan.dart';

import '../../../DependentPlugins.dart';
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
                IconButton(onPressed: _cameraScanner(state.context), icon: const Icon(FontAwesomeIcons.camera) , color: Colors.deepPurple.shade900, splashColor: Colors.deepPurple.shade700),
                IconButton(onPressed: _imageScanner, icon: const Icon(FontAwesomeIcons.images) , color: Colors.deepPurple.shade900, splashColor: Colors.deepPurple.shade700,)
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
        Map  postData = {
          "email" : context.read<UserDataCubit>().getUserData().email,
          "friendEmail" : value,
        };
        Response response = await HttpPost("auth/addfried" , postData);
      }));
    } catch (e) {
     print(e);
    }
  }


  _imageScanner() async {
    Navigator.of(state.context).pop();
    final ImagePicker _picker = ImagePicker();
    try {
      final XFile? pickedFile = await _picker.pickImage(
          source: ImageSource.gallery,
          imageQuality: 100
      );
      String? result = await Scan.parse(pickedFile!.path);
      print(result == null);
      print("------------------------------------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
      // state.setState(() {
      //   state.qrcodeResult = result;
      // });
    }catch(e){
      print(e);
    }
  }
}
