import 'package:flutter/material.dart';
import 'package:furniture_store/common/common_widgets.dart';
import 'package:furniture_store/common/custom_color.dart';
import 'package:furniture_store/common/field_validation.dart';
import 'package:furniture_store/common/text_fields_decorations.dart';
import 'package:furniture_store/controllers/change_password_screen_controller/change_password_screen_controller.dart';
import 'package:get/get.dart';

class ChangePasswordFields extends StatelessWidget {
  final changePasswordScreenController =
      Get.find<ChangePasswordScreenController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: changePasswordScreenController.formKey,
      child: Column(
        children: [
          OldPasswordField(),
          const SpacerHeight(10),
          NewPasswordField(),
          const SpacerHeight(10),
          CNewPasswordField(),
          const SpacerHeight(15),
          SubmitButton(),
        ],
      ),
    );
  }
}

class OldPasswordField extends StatelessWidget {
  final changePasswordScreenController =
      Get.find<ChangePasswordScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: changePasswordScreenController.oldPasswordFieldController,
      validator: (value) => FieldValidator().validatePassword(value!),
      decoration: formInputDecoration(hintText: 'Old Password'),
    );
  }
}

class NewPasswordField extends StatelessWidget {
  final changePasswordScreenController =
      Get.find<ChangePasswordScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: changePasswordScreenController.newPasswordFieldController,
      validator: (value) => FieldValidator().validatePassword(value!),
      decoration: formInputDecoration(hintText: 'New Password'),
    );
  }
}

class CNewPasswordField extends StatelessWidget {
  final changePasswordScreenController =
      Get.find<ChangePasswordScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: changePasswordScreenController.cNewPasswordFieldController,
      validator: (value) => FieldValidator().validatePassword(value!),
      decoration: formInputDecoration(hintText: 'Confirm New Password'),
    );
  }
}

class SubmitButton extends StatelessWidget {
  final changePasswordScreenController =
      Get.find<ChangePasswordScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (changePasswordScreenController.formKey.currentState!.validate()) {
          changePasswordScreenController.getForgotPasswordData(
            "${changePasswordScreenController.oldPasswordFieldController.text.trim()}",
            "${changePasswordScreenController.newPasswordFieldController.text.trim()}",
            "${changePasswordScreenController.cNewPasswordFieldController.text.trim()}",
          );
          cleartextFields();
        }
      },
      child: Container(
        width: Get.width,
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            'Submit',
            textScaleFactor: 1.2,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: CustomColor.kLightGreenColor,
        ),
      ),
    );
  }

  void cleartextFields() {
    changePasswordScreenController.oldPasswordFieldController.clear();
    changePasswordScreenController.newPasswordFieldController.clear();
    changePasswordScreenController.cNewPasswordFieldController.clear();
  }
}
