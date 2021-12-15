import 'package:flutter/material.dart';
import 'custom_color.dart';

ThemeData lightTheme() {
  return ThemeData.light().copyWith(
    primaryColor: CustomColor.kLightGreenColor,
    appBarTheme: AppBarTheme(color: CustomColor.kLightGreenColor),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(color: CustomColor.kLightGreenColor),
      unselectedIconTheme: IconThemeData(color: Colors.black),
      selectedLabelStyle: TextStyle(color: CustomColor.kLightGreenColor),
      unselectedLabelStyle: TextStyle(color: Colors.black),
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: CustomColor.kLightGreenColor,
    ),

    radioTheme: RadioThemeData(
      fillColor: MaterialStateColor.resolveWith((states) => CustomColor.kLightGreenColor),
    ),

    tabBarTheme: TabBarTheme(
      unselectedLabelColor: Colors.black,
      labelColor: CustomColor.kLightGreenColor,
      indicatorSize: TabBarIndicatorSize.label,
      indicator: BoxDecoration(color: Colors.transparent),
    ),
  );
}