import 'package:flutter/material.dart';
import 'package:furniture_store/controllers/notification_screen_controller/notification_screen_controller.dart';
import 'package:get/get.dart';


class NotificationListModule extends StatelessWidget {
  NotificationScreenController notificationScreenController;
  NotificationListModule({required this.notificationScreenController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView.separated(
        itemCount: notificationScreenController.notificationList.length,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        separatorBuilder: (BuildContext context, int index) =>
            Divider(height: 1, indent: 10, endIndent: 10, thickness: 1),
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  width: Get.height * 0.08,
                  height: Get.height * 0.08,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('${notificationScreenController.notificationList[index].img}'),
                        fit: BoxFit.cover,
                      )
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${notificationScreenController.notificationList[index].title}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '${notificationScreenController.notificationList[index].description}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(

                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
