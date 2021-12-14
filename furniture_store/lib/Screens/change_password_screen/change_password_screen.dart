import 'package:flutter/material.dart';
import 'package:furniture_store/common/common_widgets.dart';
import 'package:furniture_store/controllers/change_password_screen_controller/change_password_screen_controller.dart';
import 'package:get/get.dart';
import 'change_password_screen_widgets.dart';

class ChangePasswordScreen extends StatelessWidget {
  final changePasswordScreenController =
      Get.put(ChangePasswordScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: 'Change Password'),
      body: Obx(
        () => changePasswordScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ChangePasswordFields(),
                ),
              ),
      ),
    );
  }
}
