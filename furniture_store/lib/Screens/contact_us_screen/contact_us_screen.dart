import 'package:flutter/material.dart';
import 'package:furniture_store/common/common_widgets.dart';
import 'package:furniture_store/controllers/contact_us_screen_controller/contact_us_screen_controller.dart';
import 'package:get/get.dart';
import 'contact_us_screen_widgets.dart';

class ContactUsScreen extends StatelessWidget {
  final contactUsScreenController = Get.put(ContactUsScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: 'Contact Us'),

      body: Obx(
        () => contactUsScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : SingleChildScrollView(
              child: Container(
                  child: Column(
                    children: [
                      const SpacerHeight(20),
                      FormFieldsModule(),
                      const SpacerHeight(25),
                      SubmitButton(),
                      const SpacerHeight(10),
                    ],
                  ),
                ),
            ),
      ),
    );
  }
}
