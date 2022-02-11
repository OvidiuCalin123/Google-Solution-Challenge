import 'package:flutter/material.dart';
import './CameraFunc.dart';
import './GalleryFunc.dart';

void main() {
  runApp(HomeWidget());
}

class HomeWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100, // Changing the size of Appbar
          centerTitle: true, // Centering everything
          title: Text(
            "WhatsInEat",
            style: TextStyle(fontSize: 50),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            //Background code
            image: DecorationImage(
              image: NetworkImage(
                  "https://raw.githubusercontent.com/OvidiuCalin123/ImagesFlutterApp/main/Background.png?token=GHSAT0AAAAAABRPUPUYI6N7SXIWVCMIJCK6YQP3L6A"),
              fit: BoxFit.cover,
            ),
            //End Background code
          ),
          child: Column(
            children: [
              Row(
                children: [
                  CameraButton(),
                  GalleryButton(),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}
