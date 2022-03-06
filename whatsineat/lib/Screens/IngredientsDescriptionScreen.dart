import 'package:flutter/material.dart';
import 'DrawerIngredientsScreen.dart';
import 'TextDescriptionIngredients/Ingredients.dart';

class IngredientsScreenWidget extends StatefulWidget {
  var nameOfProduct = "";

  IngredientsScreenWidget(String productName) {
    nameOfProduct = productName;
  }

  @override
  State<IngredientsScreenWidget> createState() =>
      _IngredientsScreenWidgetState();
}

class _IngredientsScreenWidgetState extends State<IngredientsScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: NavigationDrawer(this.widget.nameOfProduct),
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
                this.widget.nameOfProduct, //Product name
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
              Ingredients(),
            ],
          ),
        ),
      ),
    );
  }
}
