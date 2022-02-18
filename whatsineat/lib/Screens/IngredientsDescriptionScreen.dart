import 'package:flutter/material.dart';
import 'package:whatsineat/Screens/DrawerIngredientsScreen.dart';

import 'package:whatsineat/Screens/TextDescriptionIngredients/DescriptionIngredients.dart';

class IngredientsScreenWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: NavigationDrawer(),
        appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
                icon: Icon(
                  Icons.menu,
                  size: 40,
                ),
                onPressed: () => Scaffold.of(context).openDrawer()),
          ),

          toolbarHeight: 60, // Changing the size of Appbar
          centerTitle: true,
          // Centering everything
          title: Column(
            children: [
              Text(
                "Cipsuri Lays",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "-Ingredients-",
                style: TextStyle(
                    fontSize: 20, color: Colors.white.withOpacity(0.6)),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Ingredient(),
              Ingredient(),
              Ingredient(),
              Ingredient(),
              Ingredient(),
            ],
          ),
        ),
      ),
    );
  }
}
