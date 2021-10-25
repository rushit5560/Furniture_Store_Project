import 'package:flutter/material.dart';

PreferredSizeWidget commonAppBarModule({required String title}) {
  return AppBar(
    title: Text('$title'),
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(bottomRight: Radius.circular(45)),
    ),
    centerTitle: true,
  );
}