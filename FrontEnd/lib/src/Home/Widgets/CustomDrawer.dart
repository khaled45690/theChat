// ignore_for_file: file_names, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../CommonStyle.dart';
import '../../../DependentPlugins.dart';
import '../../../businesslogic/UserData/UserBloc.dart';
import '../../QRcodes/createQR/CreateQR.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width:250,
      height:MediaQuery.of(context).size.height - 50,
      decoration: scaffoldDecoration,
      child: Column(
        children: [
          SizedBox(height:40),
          _DrawerElement(FontAwesomeIcons.penToSquare ,"Edit Profile Data" , () => _Navigator(context , Container())),
          _DrawerElement(FontAwesomeIcons.qrcode ,"Generate Qr code" , ()=> _Navigator(context , CreateQRcode(context.read<UserBloc>().getUserData().id!))),
        ],
      ),

    );
  }

  Widget _DrawerElement(IconData icon, String text , Function() onPress){
    return  MaterialButton(onPressed: onPress , splashColor: Colors.deepPurple,
      child: Row(
          children:  [
            Icon(icon , color: mainTextColor),
            SizedBox(width:20 , height:60),
            Text( text,style:TextStyle(fontSize: 20 , color: mainTextColor)),
          ]
      ),
    );
  }

  _Navigator(BuildContext context , Widget destination){
    Navigator.of(context).pop();
    navigateTo(context , destination);
  }
}
