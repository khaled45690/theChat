// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors

import 'package:chat/DependentPlugins.dart';
import 'package:chat/src/QRcodes/createQR/CreateQR.dart';
import 'package:chat/src/QRcodes/readQR/readQr.dart';
import 'package:flutter/material.dart';

class Qrcodescreen extends StatefulWidget {
    static const routename = '/Qrcode';

  @override
  State<Qrcodescreen> createState() => _QrcodescreenState();
}

class _QrcodescreenState extends State<Qrcodescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  navigateTo(context, ReadQR() );
                },
                child: Text("Read Qr code")),
            ElevatedButton(onPressed: () {
                              navigateTo(context, CreateQRcode("khaled the great"));
            }, child: Text("Create Qr code")),
          ],
        ),
      ),
    );
  }
}
