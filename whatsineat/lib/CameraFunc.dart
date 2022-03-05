import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart'; // For camera
import 'package:whatsineat/ChangePage.dart';

class CameraButton extends StatefulWidget {
  @override
  _imageCameraState createState() => _imageCameraState();
}

class _imageCameraState extends State<CameraButton> {
  String scannedText = "";
  bool confirmedPhoto = false;

  @override
  Future<void> _takePicture() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? photo =
        await _picker.pickImage(source: ImageSource.camera, maxWidth: 600);
    setState(() async {
      confirmedPhoto = true;
      selectPage(context, "LoadingScreen", image: photo);
    });
  }

  // void recognizeText(XFile image) async {
  //   final inputImage = InputImage.fromFilePath(image.path);
  //   final textDetector = GoogleMlKit.vision.textDetector();
  //   RecognisedText recognisedText = await textDetector.processImage(inputImage);
  //   await textDetector.close();
  //   scannedText = "";

  //   for (TextBlock block in recognisedText.blocks) {
  //     for (TextLine line in block.lines) {
  //       for (TextElement elm in line.elements) {
  //         scannedText = scannedText +
  //             "\n" +
  //             elm.text; // Maybe add to an array each elm.text
  //       }
  //     }
  //   }
  //   setState(() {});
  // }

  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(scannedText),
        Container(
          child: Transform.rotate(
            angle: -1.5 / 4,
            child: TextButton.icon(
              icon: Icon(
                Icons.camera_alt_sharp,
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
        ),
      ],
    );
  }
}
