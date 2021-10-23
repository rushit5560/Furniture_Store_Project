import 'package:flutter/material.dart';
import 'package:furniture_store/views/index_view/index_view.dart';
import 'package:get/get.dart';
import 'common/application_theme.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Furniture Store',
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),

      home: IndexView(),
    );
  }
}
