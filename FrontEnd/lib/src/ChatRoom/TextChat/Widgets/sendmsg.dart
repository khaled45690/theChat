import 'package:flutter/material.dart';

class SendMsg extends StatelessWidget {
  final VoidCallback expand;
  // final FocusNode focusNode;
  SendMsg(
    this.expand,
  );
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
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: TextFormField(
              // focusNode: focusNode,
              onTap: () {
                //  focusNode.requestFocus();
              },
              controller: messagecontroller,
              textAlignVertical: TextAlignVertical.center,
              keyboardType: TextInputType.multiline,
              maxLines: 2,
              minLines: 1,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Message...",
                prefixIcon:
                    InkWell(onTap: () {}, child: Icon(Icons.emoji_emotions)),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.camera_alt, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
