// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';


class BarCode extends StatelessWidget {
 final String qrcode;
const BarCode(this.qrcode);
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
