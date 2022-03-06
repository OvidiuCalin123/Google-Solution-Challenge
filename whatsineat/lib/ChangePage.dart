import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsineat/Screens/IngredientsDescriptionScreen.dart';
import 'package:whatsineat/Screens/LoadingScreen.dart';
import 'package:whatsineat/Screens/ProductsScreen.dart';
import 'package:whatsineat/main.dart';

void selectPage(BuildContext context, String name,
    {var image, var productName}) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (_) {
        if (name == 'Home') {
          return HomeWidget();
        } else if (name == 'LoadingScreen') {
          return LoadingScreenWidget(image);
        } else if (name == 'Products') {
          return ProductPageManager(productName);
        } else if (name == 'Ingredients') {
          return IngredientsScreenWidget(productName);
        }
        return HomeWidget();
        // Change Screen to Loading Screen
      },
    ),
  );
}
