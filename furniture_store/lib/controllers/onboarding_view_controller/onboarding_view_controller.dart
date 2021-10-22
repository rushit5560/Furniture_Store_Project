import 'package:flutter/material.dart';
import 'package:furniture_store/common/image_url.dart';
import 'package:furniture_store/models/onboarding_view_model/onboarding_view_model.dart';
import 'package:furniture_store/views/index_view/index_view.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingViewController extends GetxController {

  var selectedPageIndex = 0.obs;
  var pageController = PageController();
  bool get isLastPage => selectedPageIndex.value == onBoardingList.length - 1;

  forwardAction() {
    if(isLastPage){
      setOnBoardingValue();
      Get.off(() => IndexView());
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  clickSkipButton() => Get.offAll(IndexView());


  List<OnBoardingModel> onBoardingList = [
    OnBoardingModel(
      imageAsset: ImageUrl.splashImg,
      title: 'Home Furniture',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing slit. Morbi dapibus, sem vel dapibus pellentesque, tellus lectus',
    ),
    OnBoardingModel(
      imageAsset: ImageUrl.splashImg,
      title: 'Office Furniture',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing slit. Morbi dapibus, sem vel dapibus pellentesque, tellus lectus',
    ),
    OnBoardingModel(
      imageAsset: ImageUrl.splashImg,
      title: 'Kitchen Furniture',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing slit. Morbi dapibus, sem vel dapibus pellentesque, tellus lectus',
    ),
  ];

  setOnBoardingValue() async {
    SharedPreferences  prefs = await SharedPreferences.getInstance();
    prefs.setBool("onboarding", true);
  }
}