import 'package:flutter/material.dart';
import 'package:furniture_store/common/custom_color.dart';
import 'package:furniture_store/controllers/onboarding_screen_controller/onboarding_screen_controller.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {

  OnBoardingScreenController onBoardingScreenController = Get.put(OnBoardingScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            pageViewBuilder(),

            skipAndNextButton(),
          ],
        ),
      ),
    );
  }

  Widget pageViewBuilder() {
    return PageView.builder(
      controller: onBoardingScreenController.pageController,
      onPageChanged: onBoardingScreenController.selectedPageIndex,
      itemCount: onBoardingScreenController.onBoardingList.length,
      itemBuilder: (context, index) {
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(onBoardingScreenController
                  .onBoardingList[index].imageAsset,
                height: Get.height * 0.35,),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  onBoardingScreenController.onBoardingList[index].title,
                  style: TextStyle(
                    color: CustomColor.kLightGreenColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  onBoardingScreenController.onBoardingList[index].description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget skipAndNextButton() {
    return Positioned(
      right: 20,
      left: 20,
      bottom: 25,
      child:
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          GestureDetector(
            onTap: () => onBoardingScreenController.clickSkipButton(),
            child: Text(
              'Skip',
              style: TextStyle(fontSize: 18),
            ),
          ),

          Row(
            children: List.generate(
              onBoardingScreenController.onBoardingList.length,
                  (index) => Obx(
                    () => Container(
                  margin: EdgeInsets.all(4),
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                      color: onBoardingScreenController
                          .selectedPageIndex.value ==
                          index
                          ? CustomColor.kLightGreenColor
                          : Colors.grey,
                      shape: BoxShape.circle),
                ),
              ),
            ),
          ),

          FloatingActionButton(
            elevation: 0,
            backgroundColor: CustomColor.kLightGreenColor,
            onPressed: onBoardingScreenController.forwardAction,
            child: Obx(() => Text(onBoardingScreenController.isLastPage
                ? 'Start'
                : 'Next')),
          )
        ],
      ),
    );
  }
}
