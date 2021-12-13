import 'package:flutter/material.dart';
import 'package:furniture_store/common/common_functions.dart';
import 'package:furniture_store/common/common_widgets.dart';
import 'package:furniture_store/common/custom_drawer/custom_drawer_screen.dart';
import 'package:furniture_store/controllers/home_screen_controller/home_screen_controller.dart';
import 'package:furniture_store/Screens/home_screen/home_screen_widgets.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final homeScreenController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => CommonFunctions().hideKeyBoard(),
      child: Scaffold(
        appBar: appBarModule(),
        drawer: CustomDrawerScreen(),
        body: Obx(
          () => homeScreenController.isLoading.value
              ? CustomCircularProgressIndicator()
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      BannerImageSliderModule(),
                      const SizedBox(height: 10),
                      SearchTextFieldModule(),
                      const SizedBox(height: 15),
                      CategoryModule(),
                      const SizedBox(height: 15),
                      TrendingModule(),
                      const SizedBox(height: 15),
                      NewArrivalModule(),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
