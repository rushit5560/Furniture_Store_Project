import 'dart:convert';

import 'package:furniture_store/common/api_url.dart';
import 'package:furniture_store/models/category_collection_screen_model/category_collection_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CategoryCollectionScreenController extends GetxController {
  int categoryId = Get.arguments[0];
  String categoryName = Get.arguments[1];
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  RxList<Datum> categoryCollectionLists = RxList();

  getCategoryCollectionData() async {
    isLoading(true);
    String url = ApiUrl.CategoryCollectionApi;
    print('url : $url');

    try {
      Map data = {"id": "$categoryId"};

      http.Response response = await http.post(Uri.parse(url), body: data);

      CategoryCollectionData categoryCollectionData =
      CategoryCollectionData.fromJson(json.decode(response.body));
      isStatus = categoryCollectionData.success.obs;

      if (isStatus.value) {
        categoryCollectionLists = categoryCollectionData.data.obs;
      } else {
        print('CategoryCollection False False');
      }
    } catch (e) {
      print('CategoryCollection Error : $e');
    } finally {
      isLoading(false);
    }

    update();
  }

  @override
  void onInit() {
    getCategoryCollectionData();
    super.onInit();
  }
}