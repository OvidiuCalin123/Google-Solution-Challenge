import 'package:flutter/material.dart';

class ProductPageManager extends StatefulWidget {
  String productName = "";

  ProductPageManager(String prdName) {
    productName = prdName;
  }

  @override
  State<ProductPageManager> createState() => _ProductPageManagerState();
}

class _ProductPageManagerState extends State<ProductPageManager> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Products"),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      this.widget.productName + "  ",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Icon(
                  Icons.delete_forever_rounded,
                  color: Colors.red,
                  size: 50,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
