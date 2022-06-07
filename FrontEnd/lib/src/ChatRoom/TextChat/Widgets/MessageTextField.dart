import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SendMsg extends StatelessWidget {
  // final FocusNode focusNode;
  SendMsg();
  TextEditingController messagecontroller = TextEditingController();
  //FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
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
