// ignore_for_file: prefer_const_constructors, file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class CircleAvataroFPAGE extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
                 image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage("https://scontent.faly2-1.fna.fbcdn.net/v/t1.6435-9/95945567_3178758682182826_597523516736143360_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=RjS0a4X38X4AX8XmYDa&_nc_ht=scontent.faly2-1.fna&oh=00_AT-n8mRw1X6bhc-u7_48hz0kEh05YLbrB9gec5ou902GgQ&oe=62D71C8A"),
                    )
              ),

            ),
            Positioned(
                bottom: 0,
                top: 70,
                left: 60,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.white,
                  child: Icon(FontAwesomeIcons.camera),
                ))
          ],
        ),
      ],
    );
  }
}
