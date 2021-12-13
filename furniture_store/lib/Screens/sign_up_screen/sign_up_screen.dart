import 'package:flutter/material.dart';
import 'package:furniture_store/Screens/sign_up_screen/sign_up_screen_widgets.dart';
import 'package:furniture_store/common/common_widgets.dart';
import 'package:furniture_store/controllers/sign_up_screen_controller/sign_up_screen_controller.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  final signUpScreenController = Get.put(SignUpScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => signUpScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Center(
                    child: Form(
                      key: signUpScreenController.formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SignInOrSignOutWelcomeText(),
                            SizedBox(height: Get.height * 0.04),
                            SignUpUserNameFieldModule(),
                            SizedBox(height: Get.height * 0.02),
                            SignUpEmailFieldModule(),
                            SizedBox(height: Get.height * 0.02),
                            SignUpPasswordFieldModule(),
                            SizedBox(height: Get.height * 0.04),
                            SignUpButton(),
                            SizedBox(height: Get.height * 0.06),
                            SignUpWithText(),
                            SizedBox(height: Get.height * 0.04),
                            SocialLoginButtons(),
                            SizedBox(height: Get.height * 0.06),
                            SignInText(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
