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
          title: Text("Hello"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (scannedText == "")
              Text("No text detected")
            else
              Text(scannedText),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Loading",
                  style: TextStyle(fontSize: 40),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
