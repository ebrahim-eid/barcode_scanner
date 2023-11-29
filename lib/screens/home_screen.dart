import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code/screens/generate_qr.dart';
import 'package:qr_code/utils/constants.dart';

import '../utils/widgets.dart';
import 'Scan_barcode.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<PermissionStatus> _getCameraPermission() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      final result = await Permission.camera.request();
      return result;
    } else {
      return status;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
             Image(
              image: const AssetImage('assets/qr-code.png'),
              color: defaultColor,
            ),
            const SizedBox(
              height: 10,
            ),
            defaultButton(
              context,
              text: 'Generate QR Code',
              onPressed: () async {
                PermissionStatus status = await _getCameraPermission();
                if (status.isGranted) {
                  // ignore: use_build_context_synchronously
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GenerateQrCode()));
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            defaultButton(
              context,
              text: 'Scan Barcode',
              onPressed: () async {
                PermissionStatus status = await _getCameraPermission();
                if (status.isGranted) {
                  // ignore: use_build_context_synchronously
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ScaBarcode()));
                }
              },
            ),
            const Spacer(),
            const Text(
              'Developed by Ibrahim Eid',
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
