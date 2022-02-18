import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsineat/ChangePage.dart';

class NavigationDrawer extends StatelessWidget {
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            padding: EdgeInsets.all(60),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Navigation',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
          ListTile(
            title: const Text('Home',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 20)),
            onTap: () {
              selectPage(context, 'Home');
            },
          ),
          ListTile(
            title: const Text(
              'Products',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text(
              'Exit',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              SystemNavigator.pop();
            },
          ),
        ],
      ),
    );
  }
}
