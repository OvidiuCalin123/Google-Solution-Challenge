import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // For camera

class GalleryButton extends StatefulWidget {
  @override
  _imageGalleryState createState() => _imageGalleryState();
}

class _imageGalleryState extends State<GalleryButton> {
  bool imageTaken = false;

  @override
  Future<void> _takePicture() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? photo =
        await _picker.pickImage(source: ImageSource.gallery, maxWidth: 600);

    setState(() {
      File _storedImage = File(photo!.path);
      imageTaken = true;
    });
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
