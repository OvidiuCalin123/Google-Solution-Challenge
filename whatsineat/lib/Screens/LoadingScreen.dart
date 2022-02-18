import 'package:flutter/material.dart';
import 'package:whatsineat/ChangePage.dart';

class LoadingScreenWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add_alert),
              tooltip: 'Show Snackbar',
              onPressed: () {
                selectPage(context, 'Ingredients');
              },
            ),
          ],
          toolbarHeight: 100, // Changing the size of Appbar
          centerTitle: true, // Centering everything
          title: Text(
            "WhatsInEat",
            style: TextStyle(fontSize: 50),
          ),
        ),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(35),
                  child: new CircularProgressIndicator(),
                ),
                Text(
                  "Loading..",
                  style: TextStyle(fontSize: 30),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
