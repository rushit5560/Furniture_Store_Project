import 'package:flutter/material.dart';
import 'package:furniture_store/Screens/profile_screen/profile_screen_widgets.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: profileScreenAppBarModule(context),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Import From Profile Screen Widgets File
            GreenBackgroundModule(),

            Container(
              child: Column(
                children: [
                  SizedBox(height: Get.height * 0.08),

                  // Import From Profile Screen Widgets File
                  UserDetails(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

