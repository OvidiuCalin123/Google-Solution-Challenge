import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsineat/Screens/IngredientsDescriptionScreen.dart';
import 'package:whatsineat/Screens/LoadingScreen.dart';
import 'package:whatsineat/main.dart';

void selectPage(BuildContext context, String name) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (_) {
        if (name == 'Home') {
          return HomeWidget();
        } else if (name == 'LoadingScreen') {
          return LoadingScreenWidget();
        } else if (name == 'Products') {
          return LoadingScreenWidget();
        } else if (name == 'Ingredients') {
          return IngredientsScreenWidget();
        }

        return HomeWidget();
        // Change Screen to Loading Screen
      },
    ),
  );
}
