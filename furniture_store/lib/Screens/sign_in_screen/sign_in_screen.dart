import 'package:flutter/material.dart';
import 'package:furniture_store/Screens/sign_in_screen/sign_in_screen_widgets.dart';
import 'package:furniture_store/common/common_widgets.dart';
import 'package:furniture_store/controllers/sign_in_screen_controller/sign_in_screen_controller.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  final signInScreenController = Get.put(SignInScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => signInScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Center(
                    child: Form(
                      key: signInScreenController.formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SignInOrSignOutWelcomeText(),
                            SpacerHeight(Get.height * 0.04),
                            SignInEmailFieldModule(),
                            SpacerHeight(Get.height * 0.02),
                            SignInPasswordFieldModule(),
                            SpacerHeight(Get.height * 0.04),
                            LoginButton(),
                            SpacerHeight(Get.height * 0.06),
                            SignInOrSignUpWithText(text: 'Sign In With'),
                            SpacerHeight(Get.height * 0.04),
                            SocialLoginButtons(),
                            SpacerHeight(Get.height * 0.06),
                            SignUpText(),
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
