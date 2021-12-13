import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:furniture_store/common/api_url.dart';
import 'package:furniture_store/common/image_url.dart';
import 'package:furniture_store/models/home_screen_model/banner_model.dart';
import 'package:furniture_store/models/home_screen_model/category_model.dart';
import 'package:furniture_store/models/home_screen_model/featured_product_model.dart';
import 'package:furniture_store/models/home_screen_model/trending_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeScreenController extends GetxController {

  TextEditingController searchFieldController = TextEditingController();
  RxInt activeIndex = 0.obs;
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  RxList<Datum> bannerLists = RxList();
  RxList<Datum1> featuredProductLists = RxList();


  getBannerData() async {
    isLoading(true);
    String url = ApiUrl.BannerApi;
    print('Url : $url');

    try{
      http.Response response = await http.get(Uri.parse(url));

      BannerData bannerList = BannerData.fromJson(json.decode(response.body));
      isStatus = bannerList.success.obs;

      if(isStatus.value){
        bannerLists = bannerList.data.obs;
      } else {
        print('Banner False False');
      }
    } catch(e) {
      print('Banner Error : $e');
    } finally {
      isLoading(false);
      getFeaturedProductData();
    }
  }

  getFeaturedProductData() async {
    isLoading(true);
    String url = ApiUrl.FeaturedProductApi;
    print('Url : $url');

    try{
      http.Response response = await http.get(Uri.parse(url));

      FeaturedProductData featuredProductData = FeaturedProductData.fromJson(json.decode(response.body));
      isStatus = featuredProductData.success.obs;

      if(isStatus.value) {
        featuredProductLists = featuredProductData.data.obs;
      } else {
        print('FeaturedProduct False False');
      }
    } catch(e) {
      print('FeaturedProduct Error : $e');
    } finally {
      isLoading(false);
    }
  }


  List<CategoryModel> categoryList = [
    CategoryModel(img: ImageUrl.category1, name: 'Chair'),
    CategoryModel(img: ImageUrl.category2, name: 'Sofas'),
    CategoryModel(img: ImageUrl.category3, name: 'Table'),
    CategoryModel(img: ImageUrl.category4, name: 'Stool'),
    CategoryModel(img: ImageUrl.category5, name: 'Cupboard'),
    CategoryModel(img: ImageUrl.category1, name: 'Chair'),
    CategoryModel(img: ImageUrl.category2, name: 'Sofas'),
    CategoryModel(img: ImageUrl.category3, name: 'Table'),
    CategoryModel(img: ImageUrl.category4, name: 'Stool'),
    CategoryModel(img: ImageUrl.category5, name: 'Cupboard'),
  ];
  List<TrendingModel> trendingList = [
    TrendingModel(
      img: ImageUrl.product1,
      name: 'Vestibulum non pretium Felis',
      activePrice: '199',
      deActivePrice: '299',
    ),
    TrendingModel(
      img: ImageUrl.product2,
      name: 'Vestibulum non pretium Felis',
      activePrice: '199',
      deActivePrice: '299',
    ),
    TrendingModel(
      img: ImageUrl.product3,
      name: 'Vestibulum non pretium Felis',
      activePrice: '199',
      deActivePrice: '299',
    ),
    TrendingModel(
      img: ImageUrl.product2,
      name: 'Vestibulum non pretium Felis',
      activePrice: '199',
      deActivePrice: '299',
    ),
  ];

  @override
  void onInit() {
    getBannerData();
    super.onInit();
  }

}