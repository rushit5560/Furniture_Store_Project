import 'dart:async';

import 'package:furniture_store/views/index_view/index_view.dart';
import 'package:furniture_store/views/onboarding_view/onboarding_view.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashViewController extends GetxController {
  bool? onBoardingValue = false;

  getOnBoardingValue() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    onBoardingValue = prefs.getBool("onboarding");
    print('Value : $onBoardingValue');

    if(onBoardingValue == true) {
      Get.off(() => IndexView());
    }
    else{
      Get.off(() => OnBoardingView());

    }
  }

  @override
  void onInit() {
    super.onInit();
    print('Splash Controller Init Method');
    Timer(Duration(seconds: 3), () => getOnBoardingValue());
  }
}