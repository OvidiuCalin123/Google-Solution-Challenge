import 'package:flutter/material.dart';

class Ingredient extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          child: Text(
            "Sare",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                child: new Text(
                  "ingredient cu risc mediu de dauna, care este un mineral cunoscut sub denumirea tehnica de clorura de sodiu. Tocmai continutul de sodiu al sarii este important pentru organism, deoarece corpul uman are nevoie de o anumita cantitate de sare pentru a functiona corect. Pe de alta parte, consumul excesiv de sare mareste cantitatea de calciu eliminata prin urina, ceea ce poate conduce in timp la aparitia osteoporozei sau la scaderea rezistentei oaselor.",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
        Divider(
          height: 40,
          color: Colors.black,
          thickness: 1,
          endIndent: 20,
          indent: 20,
        ),
      ],
    );
  }
}
