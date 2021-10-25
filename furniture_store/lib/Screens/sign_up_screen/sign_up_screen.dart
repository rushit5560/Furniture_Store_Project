import 'package:flutter/material.dart';
import 'package:furniture_store/widgets/sign_in_screen_widgets/sign_in_screen_widgets.dart';
import 'package:furniture_store/widgets/sign_up_screen_widgets/sign_up_screen_widgets.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController userNameFieldController = TextEditingController();
  TextEditingController emailFieldController = TextEditingController();
  TextEditingController passwordFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Center(
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SignInWelcomeText(),
                    SizedBox(height: Get.height * 0.04),

                    SignUpUserNameFieldModule(userNameFieldController: userNameFieldController),
                    SizedBox(height: Get.height * 0.02),
                    SignUpEmailFieldModule(emailFieldController: emailFieldController),
                    SizedBox(height: Get.height * 0.02),
                    SignUpPasswordFieldModule(passwordFieldController: passwordFieldController),
                    SizedBox(height: Get.height * 0.04),

                    SignUpButton(
                      formKey: formKey,
                      userNameFieldController: userNameFieldController,
                      emailFieldController: emailFieldController,
                      passwordFieldController: passwordFieldController,
                    ),
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
    );
  }
}
