import 'package:flutter/material.dart';
import 'package:furniture_store/common/image_url.dart';
import 'package:furniture_store/controllers/splash_view_controller/splash_view_controller.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  // const SplashView({Key? key}) : super(key: key);

  SplashViewController splashViewController = Get.put(SplashViewController());

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
