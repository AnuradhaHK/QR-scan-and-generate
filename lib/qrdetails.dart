import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_scanner_overlay/qr_scanner_overlay.dart';

import 'package:qr_ui/constants.dart';
import 'package:qr_ui/qrscreen.dart';

class QRDetails extends StatefulWidget {
  const QRDetails({super.key});

  @override
  State<QRDetails> createState() => _QRDetailsState();
}

class _QRDetailsState extends State<QRDetails> {
  bool isFlasOn = false;
  bool isFrontCamera = false;
  bool isScanning = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kScaffoldColor,
        appBar: AppBar(
          backgroundColor: kScaffoldColor,
          elevation: 0,
          title: const Text("Scan QR",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
          centerTitle: true,
          toolbarHeight: 100,
        ),
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Stack(
                    children: [
                      MobileScanner(
                        controller: MobileScannerController(
                            detectionSpeed: DetectionSpeed.noDuplicates,
                            returnImage: true),
                        onDetect: (capture) {
                          final List<Barcode> barcodes = capture.barcodes;
                          final Uint8List? image = capture.image;
                          // for (final barcode in barcodes) {
                          //   // print('Barcode found! ${barcode.rawValue}');
                          // }

                          if (image != null) {
                            Navigator.pop(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const QRScreen()));
                          }
                        },
                      ),
                      QRScannerOverlay(
                        overlayColor: Colors.black26,
                        borderColor: Colors.yellow,
                        borderRadius: 12,
                        borderStrokeWidth: 5,
                        scanAreaWidth: 300,
                        scanAreaHeight: 300,
                      )
                    ],
                  )),
            ],
          ),
        ));
  }
}
