// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SendMsg extends StatelessWidget {
  const SendMsg();
  @override
  Widget build(BuildContext context) {
    TextEditingController messagecontroller = TextEditingController();
    return InkWell(
      onTap: () {},
      child: Container(
          height: MediaQuery.of(context).size.height / 14,
          width: MediaQuery.of(context).size.width / 1.2,
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(250),
          ),
          child: TextFormField(
            controller: messagecontroller,
            textAlignVertical: TextAlignVertical.center,
            keyboardType: TextInputType.text,
            maxLines: 3,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Message...",
              prefixIcon: InkWell(
                  onTap: () {}, child: const Icon(FontAwesomeIcons.faceMeh , color: Colors.deepPurpleAccent,)),
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(FontAwesomeIcons.camera ,  color: Colors.deepPurpleAccent),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
