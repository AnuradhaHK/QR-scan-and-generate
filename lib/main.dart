import 'package:flutter/material.dart';
// import 'package:qr_ui/qrdetails.dart';
// import 'package:qr_ui/qrdetails.dart';
import 'package:qr_ui/qrscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "QR Code Generator",
      debugShowCheckedModeBanner: false,
      home: QRScreen(),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => const QRScreen(),
      //   '/details': (context) => const QRDetails(),
      // },
    );
  }
}
