import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // For camera
import 'package:google_ml_vision/google_ml_vision.dart'; // For text recognition

class CameraButton extends StatelessWidget {
  Future<void> _takePicture() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
  }

  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
