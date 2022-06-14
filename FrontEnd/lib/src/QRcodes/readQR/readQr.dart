import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ReadQR extends StatefulWidget {
    static const routename = '/QrcodeRead';

  @override
  State<ReadQR> createState() => _ReadQRState();
}

class _ReadQRState extends State<ReadQR> {
  var qrcode = "scan me";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Scanning Qr code"),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  qrcode,
                  style: TextStyle(color: Colors.blue, fontSize: 30),
                ),
                ElevatedButton(onPressed: scanner, child: Text("Scanner")),
               
              ]),
        ));
  }

  Future<void> scanner() async {
    try {

      FlutterBarcodeScanner.scanBarcode("#2A99CF", "cancel", true, ScanMode.QR)
          .then(((value) {
        setState(() {
          qrcode = value;
        });
      }));
    } catch (e) {
      setState(() {
        qrcode = 'unable to read this';
      });
    }
  }
}
