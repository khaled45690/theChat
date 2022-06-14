import 'package:barcode_widget/barcode_widget.dart';
import 'package:chat/src/QRcodes/createQR/widgets/BarcodeWidget.dart';
import 'package:chat/src/QRcodes/createQR/widgets/TextfieldofQr.dart';
import 'package:flutter/material.dart';


class CreateQRcode extends StatefulWidget {
    static const routename = '/QrcodeCreate';

  @override
  State<CreateQRcode> createState() => _CreateQRcodeState();
}

class _CreateQRcodeState extends State<CreateQRcode> {
  var qrcode = "omar";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Creating Qr code"),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Barcodewgt(qrcode),
              SizedBox(height: 30,),
              TextfieldQr((val){
                setState(() {
                      qrcode = val;
                });
              }),
            ]),
      ),
    );
  }
}
