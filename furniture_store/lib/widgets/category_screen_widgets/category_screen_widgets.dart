import 'package:flutter/material.dart';

PreferredSizeWidget appBarModule() {
  return AppBar(
    title: Text('Category'),
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(bottomRight: Radius.circular(45)),
    ),
    centerTitle: true,

    // actions: [
    //   IconButton(
    //     onPressed: () {
    //       print('Clk');
    //     },
    //     icon: Icon(Icons.shopping_cart_rounded),
    //   ),
    //   SizedBox(width: 8),
    // ],
  );
}