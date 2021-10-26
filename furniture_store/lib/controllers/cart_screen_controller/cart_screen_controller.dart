import 'package:furniture_store/common/image_url.dart';
import 'package:furniture_store/models/cart_screen_model/cart_screen_model.dart';
import 'package:get/get.dart';

class CartScreenController extends GetxController {

  List<CartItemModel> cartItemList = [
    CartItemModel(
      img: ImageUrl.product1,
      title: 'Vestibulum non pretium Felis',
      qty: 1,
      price: '499'
    ),
    CartItemModel(
        img: ImageUrl.product1,
        title: 'Vestibulum non pretium Felis',
        qty: 1,
        price: '499'
    ),
    CartItemModel(
        img: ImageUrl.product1,
        title: 'Vestibulum non pretium Felis',
        qty: 1,
        price: '499'
    ),
  ];
}