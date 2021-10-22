import 'package:flutter/material.dart';
import 'package:furniture_store/common/custom_color.dart';
import 'package:furniture_store/controllers/onboarding_view_controller/onboarding_view_controller.dart';
import 'package:get/get.dart';

class OnBoardingView extends StatelessWidget {

  OnBoardingViewController onBoardingViewController = Get.put(OnBoardingViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView.builder(
              controller: onBoardingViewController.pageController,
              onPageChanged: onBoardingViewController.selectedPageIndex,
              itemCount: onBoardingViewController.onBoardingList.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(onBoardingViewController
                          .onBoardingList[index].imageAsset,
                        height: Get.height * 0.35,),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          onBoardingViewController.onBoardingList[index].title,
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
                          onBoardingViewController.onBoardingList[index].description,
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
            ),


            Positioned(
              right: 20,
              left: 20,
              bottom: 25,
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  GestureDetector(
                    onTap: () => onBoardingViewController.clickSkipButton(),
                    child: Text(
                      'Skip',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),

                  Row(
                    children: List.generate(
                      onBoardingViewController.onBoardingList.length,
                          (index) => Obx(
                            () => Container(
                          margin: EdgeInsets.all(4),
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                              color: onBoardingViewController
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
                    onPressed: onBoardingViewController.forwardAction,
                    child: Obx(() => Text(onBoardingViewController.isLastPage
                        ? 'Start'
                        : 'Next')),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
