import 'package:flutter/material.dart';
import 'package:furniture_store/Screens/sign_in_screen/sign_in_screen.dart';
import 'package:furniture_store/common/custom_color.dart';
import 'package:furniture_store/common/field_validation.dart';
import 'package:furniture_store/common/text_fields_decorations.dart';
import 'package:furniture_store/controllers/sign_up_screen_controller/sign_up_screen_controller.dart';
import 'package:get/get.dart';

class SignUpUserNameFieldModule extends StatelessWidget {
  final signUpScreenController = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'UserName',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        TextFormField(
          controller: signUpScreenController.userNameFieldController,
          cursorColor: CustomColor.kLightGreenColor,
          keyboardType: TextInputType.emailAddress,
          validator: (value) => FieldValidator().validateFullName(value!),
          decoration: formInputDecoration(hintText: 'Enter UserName'),
        ),
      ],
    );
  }
}

class SignUpEmailFieldModule extends StatelessWidget {
  final signUpScreenController = Get.find<SignUpScreenController>();

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
          controller: signUpScreenController.emailFieldController,
          cursorColor: CustomColor.kLightGreenColor,
          keyboardType: TextInputType.emailAddress,
          validator: (value) => FieldValidator().validateEmail(value!),
          decoration: formInputDecoration(hintText: 'Enter Email'),
        ),
      ],
    );
  }
}

class SignUpPasswordFieldModule extends StatelessWidget {
  final signUpScreenController = Get.find<SignUpScreenController>();

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
          controller: signUpScreenController.passwordFieldController,
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

class SignUpButton extends StatelessWidget {
  final signUpScreenController = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (signUpScreenController.formKey.currentState!.validate()) {
          signUpScreenController.getRegisterData(
            "${signUpScreenController.userNameFieldController.text.trim()}",
            "${signUpScreenController.emailFieldController.text.trim().toLowerCase()}",
            "${signUpScreenController.passwordFieldController.text.trim()}",
          );
        }
      },
      child: Container(
        color: CustomColor.kLightGreenColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Center(
            child: Text(
              'Sign Up',
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

class SignUpWithText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Sign Up With',
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class SignInText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Have A Already Account? ',
          style: TextStyle(fontSize: 15),
        ),
        GestureDetector(
          onTap: () {
            Get.off(() => SignInScreen());
          },
          child: Text(
            'Signin',
            style: TextStyle(color: CustomColor.kLightGreenColor, fontSize: 15),
          ),
        ),
      ],
    );
  }
}
