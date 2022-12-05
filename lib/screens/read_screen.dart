import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ReadQrScreen extends StatefulWidget {
  const ReadQrScreen({super.key});

  @override
  State<ReadQrScreen> createState() => _ReadQrScreenState();
}

class _ReadQrScreenState extends State<ReadQrScreen> {
  var qrData;
  @override
  void initState() {
    qrData = 'Scan now';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                qrData,
                style: const TextStyle(fontSize: 25, color: Colors.blue),
              ),
              ElevatedButton(
                onPressed: scanQr,
                child: const Text(
                  'Scan Qr code',
                  style: TextStyle(
                    fontSize: 35,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future scanQr() async {
    await FlutterBarcodeScanner.scanBarcode(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE)
        .then((value) {
          if(mounted)
      setState(() {
        qrData = value;
      });
    }).catchError((error) {
      setState(() {
        qrData = error.toString();
      });
    });
  }
}
