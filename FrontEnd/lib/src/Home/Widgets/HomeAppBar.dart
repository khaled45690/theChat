// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../CommonStyle.dart';
Size size = Size(100, 100);
class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(

      backgroundColor: Colors.transparent, shadowColor: Colors.transparent, elevation:0,
      leading: IconButton(
        icon: Icon(FontAwesomeIcons.alignJustify , color: mainTextColor),
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children:  [
              Text("Chat" , style: TextStyle(fontSize: 35 ,  color: mainTextColor, fontFamily: "VLADIMIR" , fontWeight: FontWeight.w300),),
            ],
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => size;
}
