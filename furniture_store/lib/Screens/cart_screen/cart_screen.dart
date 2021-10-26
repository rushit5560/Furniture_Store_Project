import 'package:flutter/material.dart';
import 'package:furniture_store/common/common_widgets.dart';
import 'package:furniture_store/controllers/cart_screen_controller/cart_screen_controller.dart';
import 'package:furniture_store/widgets/cart_screen_widgets/cart_screen_widgets.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  CartScreenController cartScreenController = Get.put(CartScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: commonAppBarModule(title: 'Cart'),

      body: Column(
        children: [
          CartItemsListModule(cartScreenController: cartScreenController),
          Divider(thickness: 1,indent: 8, endIndent: 8),
          CartPriceModule(),

          SizedBox(height: 20),
          CheckOutButton(),
        ],
      ),
    );
  }




}
