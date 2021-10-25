import 'package:flutter/material.dart';
import 'package:furniture_store/common/common_widgets.dart';
import 'package:furniture_store/controllers/notification_screen_controller/notification_screen_controller.dart';
import 'package:furniture_store/widgets/notification_screen_widgets/notification_screen_widgets.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreenController notificationScreenController = Get.put(NotificationScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule('Notification'),

      // Import From Notification Screen Widgets File
      body: NotificationListModule(notificationScreenController: notificationScreenController),
    );
  }
}
