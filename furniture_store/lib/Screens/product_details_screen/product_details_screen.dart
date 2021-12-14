import 'package:flutter/material.dart';
import 'package:furniture_store/common/common_widgets.dart';
import 'package:furniture_store/controllers/product_details_screen_controller/product_details_screen_controller.dart';
import 'package:get/get.dart';
import 'product_details_screen_widgets.dart';

class ProductDetailsScreen extends StatelessWidget {
  final productDetailsScreenController =
      Get.put(ProductDetailsScreenController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: commonAppBarModule(title: '', index: 1),
        body: Obx(
          () => productDetailsScreenController.isLoading.value
              ? CustomCircularProgressIndicator()
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        clipBehavior: Clip.none,
                        children: [
                          ProductImageSliderModule(),
                          Positioned(
                            bottom: 5,
                            child: ProductImageBannerIndicator(),
                          ),
                          Positioned(
                            right: 12,
                            bottom: -12,
                            child: FavouriteButton(),
                          ),
                        ],
                      ),
                      ProductDetails(),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
