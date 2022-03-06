import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsineat/CameraFunc.dart';
import 'package:whatsineat/ChangePage.dart';

class LoadingScreenWidget extends StatefulWidget {
  late XFile photo;
  LoadingScreenWidget(XFile image) {
    photo = image;
  }
  @override
  State<LoadingScreenWidget> createState() => _LoadingScreenWidgetState();
}

class _LoadingScreenWidgetState extends State<LoadingScreenWidget> {
  String scannedText = "";
  bool checkScanned = false;
  String productName = "";

  @override
  void recognizeText(XFile image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    final textDetector = GoogleMlKit.vision.textDetector();
    RecognisedText recognisedText = await textDetector.processImage(inputImage);
    await textDetector.close();
    scannedText = "";

    for (TextBlock block in recognisedText.blocks) {
      for (TextLine line in block.lines) {
        for (TextElement elm in line.elements) {
          scannedText = scannedText +
              "\n" +
              elm.text; // Maybe add to an array each elm.text
        }
      }
    }
    setState(() {});
  }

  Widget build(BuildContext context) {
    if (!checkScanned) {
      recognizeText(this.widget.photo);
      checkScanned = true;
    }
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("WhatsInEat"),
        ),
        body: Column(
          children: [
            if (scannedText.isNotEmpty)
              Container(
                padding: const EdgeInsets.only(top: 80, left: 20, bottom: 15),
                child: new TextField(
                  onChanged: (String str) {
                    productName = str;
                  },
                  autofocus: true,
                  decoration: new InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 10),
                    hintText: "Enter product name",
                  ),
                ),
              ),
            if (scannedText.isNotEmpty)
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (productName != "")
                      selectPage(context, "Ingredients",
                          productName: productName);
                  });
                },
                child: Text("Add"),
                style: ElevatedButton.styleFrom(primary: Colors.blue),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (!scannedText.isNotEmpty)
                        Text(
                          "Loading",
                          style: TextStyle(fontSize: 40),
                        )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
