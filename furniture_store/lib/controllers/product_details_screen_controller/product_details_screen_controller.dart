import 'package:flutter/material.dart';
import 'package:furniture_store/common/image_url.dart';
import 'package:get/get.dart';

class ProductDetailsScreenController extends GetxController {

  RxInt activeIndex = 0.obs;
  List<String> productImgList = [ImageUrl.product1, ImageUrl.product2, ImageUrl.product3];


}