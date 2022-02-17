import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsineat/Screens/LoadingScreen.dart';

void selectPage(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (_) {
        return LoadingScreenWidget(); // Change Screen to Loading Screen
      },
    ),
  );
}
