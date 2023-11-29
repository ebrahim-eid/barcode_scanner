import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_code/utils/widgets.dart';

class ScaBarcode extends StatefulWidget {
  const ScaBarcode({super.key});

  @override
  State<ScaBarcode> createState() => _ScaBarcodeState();
}

class _ScaBarcodeState extends State<ScaBarcode> {
  String ? data;

  Future<void>scanCode()async{
     String barcodeScanResult;
    try{
      barcodeScanResult = await FlutterBarcodeScanner.scanBarcode(
        '#FFA500',
        'Cancel',
        true,
        ScanMode.DEFAULT,
      );
      debugPrint(barcodeScanResult);
    }on PlatformException{
      barcodeScanResult='Failed';
    }
    if(!mounted) return;
    setState(() {
      data=barcodeScanResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                defaultButton(
                    context,
                    text: 'Scan QR & barCode',
                  onPressed: (){
                    scanCode();
                  },
                ),

                const SizedBox(height: 10,),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black,width: 1),
                    color: Colors.white
                  ),
                  child: Text( data==null? 'START SCAN NOW 🔎' : data!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold

                  ),)
                ),
                const SizedBox(height: 10,),
                if(data !=null)
                IconButton(onPressed: ()async{
                  await FlutterClipboard.copy(data!);
                }, icon: const Icon(Icons.copy,size: 40,),color: Colors.orange)
              ],
            ),
          ),
        ),
      ),
    );
  }
}


