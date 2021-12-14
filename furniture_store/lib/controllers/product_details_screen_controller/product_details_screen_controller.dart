import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:furniture_store/common/api_url.dart';
import 'package:furniture_store/models/product_detail_screen_model/addtocart_model.dart';
import 'package:furniture_store/models/product_detail_screen_model/get_product_review_model.dart';
import 'package:furniture_store/models/product_detail_screen_model/product_detail_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProductDetailsScreenController extends GetxController {
  int productId = Get.arguments;
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  RxInt activeIndex = 0.obs;
  RxList<Datum> productDetailLists = RxList();
  RxList<Datum1> productReviewList = RxList();
  TextEditingController reviewAddFieldController = TextEditingController();
  var userId;


  getProductDetailData() async {
    isLoading(true);
    String url = ApiUrl.ProductDetailApi;
    print('Url : $url');

    try{
      Map data = {
        "id": "$productId"
      };

      http.Response response = await http.post(Uri.parse(url), body: data);

      ProductDetailsData productDetailsData = ProductDetailsData.fromJson(json.decode(response.body));
      isStatus = productDetailsData.success.obs;

      if(isStatus.value){
        productDetailLists = productDetailsData.data.obs;
      } else {
        print('Product Details False False');
      }

    } catch(e) {
      print('Product Details Error : $e');
    } finally {
      // isLoading(false);
      getProductReview();
    }

  }

  getProductReview() async {
    isLoading(true);
    String url = ApiUrl.ProductReviewApi;
    print('Url : $url');

    try{
      Map data = {
        "productid": "$productId"
      };
      print('data : $data');
      http.Response response = await http.post(Uri.parse(url), body: data);
      ProductReviewData productReviewData = ProductReviewData.fromJson(json.decode(response.body));

      isStatus = productReviewData.success.obs;

      if(isStatus.value){
        productReviewList.clear();
        productReviewList = productReviewData.data.obs;
        print('productReviewList : $productReviewList');
      } else {
        print('Product Review False False');
      }
    } catch(e){
      print('Product Review Error : $e');
    } finally {
      isLoading(false);
    }
  }


  productAddToCart() async {
    isLoading(true);
    String url = ApiUrl.AddToCartApi;
    print('Url : $url');
    print('productId : $productId');

    try{
      // int productQty = 1;
      Map data = {
        "product_id": "$productId",
        "user_id": "$userId",
        "quantity": "1"
      };
      print('data123 : $data');

      http.Response response = await http.post(Uri.parse(url), body: data);
      AddToCartData addToCartData =AddToCartData.fromJson(json.decode(response.body));
      isStatus = addToCartData.success.obs;

      if(isStatus.value) {
        print('True True');
        Get.snackbar('', 'Product Add in Cart Successfully');
      } else {
        print('False False');
      }
    } catch(e){
      print('Product Add To Cart Error : $e');
    } finally {
      isLoading(false);
    }
  }


  @override
  void onInit() {
    getProductDetailData();
    getUserDetailFromPrefs();
    super.onInit();
  }

  getUserDetailFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt('id').toString();
    print('UserId : $userId');
  }
}