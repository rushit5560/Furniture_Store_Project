import 'package:flutter/material.dart';
import 'package:furniture_store/common/common_widgets.dart';
import 'package:furniture_store/controllers/checkout_screen_controller/checkout_screen_controller.dart';
import 'package:furniture_store/widgets/checkout_screen_widgets/checkout_screen_widgets.dart';
import 'package:get/get.dart';

class CheckOutScreen extends StatelessWidget {
  // const CheckOutScreen({Key? key}) : super(key: key);
  CheckOutScreenController checkOutScreenController = Get.put(CheckOutScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: commonAppBarModule(title: 'Checkout',index: 0),

      body: Column(
        children: [
          const SizedBox(height: 10),
          ShippingDetails(),

          const Divider(thickness: 2, indent: 8, endIndent: 8),
          PaymentMethods(checkOutScreenController: checkOutScreenController),
          const SizedBox(height: 10),

          ProceedButton(),
          const SizedBox(height: 10),
          
        ],
      ),
    );
  }


}
