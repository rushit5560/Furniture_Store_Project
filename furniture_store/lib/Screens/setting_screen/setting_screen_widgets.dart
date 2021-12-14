import 'package:flutter/material.dart';
import 'package:furniture_store/Screens/change_password_screen/change_password_screen.dart';
import 'package:get/get.dart';

class ChangePasswordModule extends StatelessWidget {
  const ChangePasswordModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ChangePasswordScreen());
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
        child: Material(
          borderRadius: BorderRadius.circular(35),
          elevation: 10,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            child: Container(
              width: Get.width,
              child: Text(
                'Change Password',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
