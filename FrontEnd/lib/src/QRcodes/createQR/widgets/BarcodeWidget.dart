import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';


class Barcodewgt extends StatelessWidget {
 var qrcode;
Barcodewgt(this.qrcode);
  @override
  Widget build(BuildContext context) {
    return BarcodeWidget(
      data: qrcode,
      barcode: Barcode.qrCode(),
      color: Colors.blue,
      height: 250,
      width: 250,
    );
  }
}
