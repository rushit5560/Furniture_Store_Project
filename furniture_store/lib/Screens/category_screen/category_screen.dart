import 'package:flutter/material.dart';
import 'package:furniture_store/common/common_widgets.dart';
import 'package:furniture_store/controllers/category_screen_controller/category_screen_controller.dart';
import 'package:furniture_store/Screens/category_screen/category_screen_widgets.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  final categoryScreenController = Get.put(CategoryScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: 'Category'),
      body: Obx(
        () => categoryScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: CategoryListModule(),
              ),
      ),
    );
  }


}
