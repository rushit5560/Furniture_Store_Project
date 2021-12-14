import 'package:flutter/material.dart';
import 'package:furniture_store/common/common_widgets.dart';
import 'package:furniture_store/common/custom_color.dart';
import 'package:furniture_store/common/field_validation.dart';
import 'package:furniture_store/common/text_fields_decorations.dart';
import 'package:furniture_store/controllers/contact_us_screen_controller/contact_us_screen_controller.dart';
import 'package:get/get.dart';

class FormFieldsModule extends StatelessWidget {
  final contactUsScreenController = Get.find<ContactUsScreenController>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: contactUsScreenController.formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            FullNameField(),
            const SpacerHeight(12),
            EmailIdField(),
            const SpacerHeight(12),
            PhoneNoField(),
            const SpacerHeight(12),
            SubjectField(),
            const SpacerHeight(12),
            CommentField(),
            const SpacerHeight(12),
          ],
        ),
      ),
    );
  }
}

class FullNameField extends StatelessWidget {
  final contactUsScreenController = Get.find<ContactUsScreenController>();
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: contactUsScreenController.fullNameController,
      validator: (value) => FieldValidator().validateFullName(value!),
      decoration: formInputDecoration(hintText: 'Full Name'),
    );
  }
}

class EmailIdField extends StatelessWidget {
  final contactUsScreenController = Get.find<ContactUsScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: contactUsScreenController.emailIdController,
      validator: (value) => FieldValidator().validateEmail(value!),
      decoration: formInputDecoration(hintText: 'Email Id'),
    );
  }
}

class PhoneNoField extends StatelessWidget {
  final contactUsScreenController = Get.find<ContactUsScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 10,
      controller: contactUsScreenController.phoneNoController,
      validator: (value) => FieldValidator().validateMobile(value!),
      decoration: formInputDecoration(hintText: 'Phone No'),
    );
  }
}

class SubjectField extends StatelessWidget {
  final contactUsScreenController = Get.find<ContactUsScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: contactUsScreenController.subjectController,
      validator: (value) => FieldValidator().validateSubject(value!),
      decoration: formInputDecoration(hintText: 'Subject'),
    );
  }
}

class CommentField extends StatelessWidget {
  final contactUsScreenController = Get.find<ContactUsScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: contactUsScreenController.commentController,
      validator: (value) => FieldValidator().validateComment(value!),
      decoration: formInputDecoration(hintText: 'Comment'),
      maxLines: 3,
    );
  }
}

class SubmitButton extends StatelessWidget {
  final contactUsScreenController = Get.find<ContactUsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: GestureDetector(
        onTap: () => _submitButtonOnTap(),
        child: Container(
          width: Get.width,
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(30),
            color: CustomColor.kLightGreenColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Center(
              child: Text(
                'Submit',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _submitButtonOnTap() {
    if(contactUsScreenController.formKey.currentState!.validate()){
      contactUsScreenController.getContactUsData(
        "${contactUsScreenController.fullNameController.text.trim()}",
        "${contactUsScreenController.emailIdController.text.trim().toLowerCase()}",
        "${contactUsScreenController.phoneNoController.text.trim()}",
        "${contactUsScreenController.subjectController.text.trim()}",
        "${contactUsScreenController.commentController.text.trim()}",
      );
      _clearTextFields();
    }
  }
  _clearTextFields() {
    contactUsScreenController.fullNameController.clear();
    contactUsScreenController.emailIdController.clear();
    contactUsScreenController.phoneNoController.clear();
    contactUsScreenController.subjectController.clear();
    contactUsScreenController.commentController.clear();
  }



}
