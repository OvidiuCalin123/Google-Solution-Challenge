import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Ingredients extends StatefulWidget {
  @override
  _data createState() => _data();
}

class _data extends State<Ingredients> {
  final url = "https://jsonplaceholder.typicode.com/posts";

  var _postsJson = [];
  void fetchPosts() async {
    // try and catch if user doesnt have internet
    try {
      final response = await get(Uri.parse(url));
      final jsonData = jsonDecode(response.body) as List;

      setState(() {
        _postsJson = jsonData;
      });
    } catch (err) {
      // Tell the user he doesnt have internet
    }
  }

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  Widget build(BuildContext context) {
    final children = <Widget>[];

    for (var i = 0; i < 5; i++) {
      // Instead of 5 add how many ingredients you have
      children.add(
        new Container(
            padding: EdgeInsets.all(10),
            child: Text("${_postsJson[i]["title"]}")),
      );
      children.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  child: new Text("${_postsJson[i]["body"]}")),
            ),
          ],
        ),
      );
      children.add(
        Divider(
          height: 40,
          color: Colors.black,
          thickness: 1,
          endIndent: 20,
          indent: 20,
        ),
      );
    }
    return Column(children: children);
  }
}
