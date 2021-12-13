import 'package:flutter/material.dart';
import 'package:furniture_store/Screens/sign_up_screen/sign_up_screen.dart';
import 'package:furniture_store/common/custom_color.dart';
import 'package:furniture_store/common/field_validation.dart';
import 'package:furniture_store/common/text_fields_decorations.dart';
import 'package:furniture_store/controllers/sign_in_screen_controller/sign_in_screen_controller.dart';
import 'package:get/get.dart';

class SignInEmailFieldModule extends StatelessWidget {
  final signInScreenController = Get.find<SignInScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Email',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        TextFormField(
          controller: signInScreenController.emailFieldController,
          cursorColor: CustomColor.kLightGreenColor,
          keyboardType: TextInputType.emailAddress,
          validator: (value) => FieldValidator().validateEmail(value!),
          decoration: formInputDecoration(hintText: 'Enter Email'),
        ),
      ],
    );
  }
}

class SignInPasswordFieldModule extends StatelessWidget {
  final signInScreenController = Get.find<SignInScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Password',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        TextFormField(
          controller: signInScreenController.passwordFieldController,
          cursorColor: CustomColor.kLightGreenColor,
          keyboardType: TextInputType.emailAddress,
          obscureText: true,
          validator: (value) => FieldValidator().validatePassword(value!),
          decoration: formInputDecoration(hintText: 'Enter Password'),
        ),
      ],
    );
  }
}

class LoginButton extends StatelessWidget {
  final signInScreenController = Get.find<SignInScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (signInScreenController.formKey.currentState!.validate()) {
          signInScreenController.getSignInData(
              "${signInScreenController.emailFieldController.text.trim().toLowerCase()}",
              "${signInScreenController.passwordFieldController.text.trim()}",
          );
        }
      },
      child: Container(
        color: CustomColor.kLightGreenColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Center(
            child: Text(
              'Login',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SignUpText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'No Account? ',
          style: TextStyle(fontSize: 15),
        ),
        GestureDetector(
          onTap: () {
            Get.off(() => SignUpScreen());
          },
          child: Text(
            'Signup',
            style: TextStyle(color: CustomColor.kLightGreenColor, fontSize: 15),
          ),
        ),
      ],
    );
  }
}
