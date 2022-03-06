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
  bool test = false;
  @override
  Future<void> _takePicture() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? photo =
        await _picker.pickImage(source: ImageSource.camera, maxWidth: 600);
    if (photo!.path.isNotEmpty) {
      test = true;
      selectPage(context, "LoadingScreen", image: photo);
    }
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
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
