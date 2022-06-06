import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../Home/Widgets/Avatar.dart';
Size size = Size(100, 100);
class TextChatAppBar extends StatelessWidget  with PreferredSizeWidget{
  const TextChatAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff1A0E5A),
      padding: EdgeInsets.only(top: 30 , bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(onPressed: (){Navigator.of(context).pop();}, icon: Icon(FontAwesomeIcons.arrowLeft , color: Colors.deepPurpleAccent,)),
              Avatar(),
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: (){}, icon: const Icon(FontAwesomeIcons.videoCamera , color: Colors.deepPurpleAccent,) , splashColor: Colors.deepPurpleAccent ,),
              IconButton(onPressed: (){}, icon: const Icon(FontAwesomeIcons.phone , color: Colors.deepPurpleAccent, ) , splashColor: Colors.deepPurpleAccent),

            ],
          )

        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => size;
}
