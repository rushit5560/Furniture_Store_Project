import 'package:flutter/material.dart';
import 'package:furniture_store/widgets/sign_in_view_widgets/sign_in_view_widgets.dart';
import 'package:get/get.dart';

class SignInView extends StatelessWidget {
  // const SignInView({Key? key}) : super(key: key);

  GlobalKey<FormState> formKey = GlobalKey();
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

                    SignInEmailFieldModule(emailFieldController: emailFieldController),
                    SizedBox(height: Get.height * 0.02),
                    SignInPasswordFieldModule(passwordFieldController: passwordFieldController),
                    SizedBox(height: Get.height * 0.04),

                    LoginButton(
                      formKey: formKey,
                      emailFieldController: emailFieldController,
                      passwordFieldController: passwordFieldController,
                    ),
                    SizedBox(height: Get.height * 0.06),

                    SignInWithText(),
                    SizedBox(height: Get.height * 0.04),
                    SocialLoginButtons(),
                    SizedBox(height: Get.height * 0.06),

                    SignUpText(),
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
