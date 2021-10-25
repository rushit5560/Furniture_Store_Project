import 'package:flutter/material.dart';
import 'package:furniture_store/common/image_url.dart';
import 'package:furniture_store/controllers/splash_screen_controller/splash_screen_controller.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  // const SplashView({Key? key}) : super(key: key);

  SplashScreenController splashScreenController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image(
        image: AssetImage('${ImageUrl.splashImg}'),
        fit: BoxFit.cover,
        height: Get.height,
        width: Get.width,
      ),
    );
  }
}
