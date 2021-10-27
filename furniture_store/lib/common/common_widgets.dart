import 'package:flutter/material.dart';
import 'package:furniture_store/Screens/cart_screen/cart_screen.dart';
import 'package:get/get.dart';

PreferredSizeWidget commonAppBarModule({required String title, required int index}) {
  return AppBar(
    title: Text('$title'),
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(bottomRight: Radius.circular(45)),
    ),
    centerTitle: true,

    actions: [
      index == 1
          ? IconButton(
              onPressed: () {
                Get.to(() => CartScreen());
              },
              icon: Icon(Icons.shopping_cart_rounded),
            )
          : Container(),
      SizedBox(width: 8),
    ],
  );
}