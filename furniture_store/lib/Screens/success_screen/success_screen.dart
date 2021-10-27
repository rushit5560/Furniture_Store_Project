import 'package:flutter/material.dart';
import 'package:furniture_store/Screens/index_screen/index_screen.dart';
import 'package:furniture_store/Screens/order_track_screen/order_track_screen.dart';
import 'package:furniture_store/common/custom_color.dart';
import 'package:get/get.dart';

class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _iconModule(),
              const SizedBox(height: 10),
              _thankYouModule(),
              const SizedBox(height: 20),
              _orderText(),
              const SizedBox(height: 5),
              _orderTrackTextModule(),
              const SizedBox(height: 20),
              _shoppingButtonModule(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _iconModule() {
    return Container(
      height: Get.height * 0.16,
      width: Get.height * 0.16,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: CustomColor.kLightGreenColor),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.check_rounded,
            size: 90,
            color: CustomColor.kLightGreenColor,
          ),
        ),
      ),
    );
  }

  Widget _thankYouModule() {
    return Text(
      'Thank You',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    );
  }

  Widget _orderText() {
    return Text(
      'Your Order is Completed please check your order',
      maxLines: 1,
    );
  }

  Widget _orderTrackTextModule() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('status on '),
        GestureDetector(
          onTap: () => Get.to(() => OrderTrackScreen()),
          child: Text(
            'Order track',
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 16,
              color: CustomColor.kLightGreenColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _shoppingButtonModule() {
    return GestureDetector(
      onTap: () => Get.offAll(() => IndexScreen()),
      child: Container(
        color: CustomColor.kLightGreenColor,
        width: Get.width * 0.65,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              'Continue Shopping',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
