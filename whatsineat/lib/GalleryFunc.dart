import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

import 'ChangePage.dart'; // For camera

class GalleryButton extends StatefulWidget {
  @override
  _imageGalleryState createState() => _imageGalleryState();
}

class _imageGalleryState extends State<GalleryButton> {
  bool imageTaken = false;
  String scannedText = "";
  @override
  Future<void> _takePicture() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? photo =
        await _picker.pickImage(source: ImageSource.gallery, maxWidth: 600);

    setState(() {
      //selectPage(context, 'LoadingScreen');
      recognizeText(photo!);
      imageTaken = true;
    });
  }

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
    return Container(
      child: Transform.rotate(
        angle: 1.5 / 4,
        child: TextButton.icon(
          icon: Icon(
            Icons.add_photo_alternate_sharp,
            size: 100,
          ),
          label: Text(""),
          onPressed: () {
            _takePicture();
          },
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
                side: BorderSide(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
      padding: EdgeInsets.all(35),
    );
  }
}
