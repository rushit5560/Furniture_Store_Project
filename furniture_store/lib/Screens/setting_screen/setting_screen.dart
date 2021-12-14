import 'package:flutter/material.dart';
import 'package:furniture_store/common/common_widgets.dart';
import 'setting_screen_widgets.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: 'Settings'),

      body: Column(
        children: [
          ChangePasswordModule(),
        ],
      ),
    );
  }
}
