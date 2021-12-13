import 'dart:convert';

import 'package:furniture_store/common/api_url.dart';
import 'package:furniture_store/models/cart_screen_model/cart_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CartScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  RxList<Cartditeil> userCartProductLists = RxList();
  RxInt userCartTotalAmount = 0.obs;

  getUserCartData(userId) async {
    isLoading(true);
    String url = ApiUrl.UserCartApi;
    print('Url : $url');

    try {
      Map data = {"user_id": "$userId"};
      http.Response response = await http.post(Uri.parse(url), body: data);
      UserCartData userCartData =
          UserCartData.fromJson(json.decode(response.body));
      isStatus = userCartData.success.obs;

      if (isStatus.value) {
        userCartProductLists.clear();
        userCartProductLists = userCartData.data.cartditeil.obs;
        userCartTotalAmount = userCartData.data.cart.totalprice.obs;
      } else {
        print('User Cart False');
      }
    } catch (e) {
      print('User Cart Data Error : $e');
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getUserDetailsFromPrefs();
    super.onInit();
  }

  getUserDetailsFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId1 = prefs.getInt('id');
    print('UserId Add to Cart : $userId1');
    getUserCartData(userId1);
  }
}
