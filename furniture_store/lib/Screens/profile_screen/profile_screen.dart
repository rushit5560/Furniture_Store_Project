import 'package:flutter/material.dart';
import 'package:furniture_store/Screens/profile_screen/profile_screen_widgets.dart';
import 'package:furniture_store/controllers/profile_screen_controller/profile_screen_controller.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  final profileScreenController = Get.put(ProfileScreenController());

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

