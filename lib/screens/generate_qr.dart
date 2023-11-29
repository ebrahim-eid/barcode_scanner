import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../utils/widgets.dart';

class GenerateQrCode extends StatefulWidget {
  const GenerateQrCode({super.key});

  @override
  State<GenerateQrCode> createState() => _GenerateQrCodeState();
}

class _GenerateQrCodeState extends State<GenerateQrCode> {
  String? data;
  var controller = TextEditingController();
  var formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                if (data != null) QrImageView(
                    data: data!,
                    version: QrVersions.auto,
                    size: 300,
                  ) else const Image(
                  image: AssetImage('assets/question.png'),
                  width: 200,
                ),
                const SizedBox(height: 40,),
                Form(
                  key: formKey,
                  child: TextFormField(
                    controller: controller,
                    onFieldSubmitted: (value) {
                      if (formKey.currentState!.validate()){
                        setState(() {
                          data = value;
                        });
                      }
                    },
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Enter data!!!!!';
                      }
                      return null;

                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Enter Data'),
                  ),
                ),
                const SizedBox(height: 10,),
                defaultButton(context, text: 'Create QR Code', onPressed: (){
                  if (formKey.currentState!.validate()){
                    setState(() {
                      data = controller.text;
                    });
                  }
                },),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
