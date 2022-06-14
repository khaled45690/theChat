import 'package:barcode_widget/barcode_widget.dart';
import 'package:chat/src/QRcodes/createQR/widgets/BarcodeWidget.dart';
import 'package:chat/src/QRcodes/createQR/widgets/TextfieldofQr.dart';
import 'package:flutter/material.dart';

import '../../../CommonStyle.dart';


class CreateQRcode extends StatelessWidget {
  final String qrCode;
  const CreateQRcode(this.qrCode);

  @override
  Widget build(BuildContext context) {
    return Container(
      width:MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: scaffoldDecoration,
      child: Center(
        child: BarcodeWidget(
          data: qrCode,
          barcode: Barcode.qrCode(),
          color: Colors.deepPurpleAccent,
          height: 250,
          width: 250,
        ),
      ),
    );
  }
}

