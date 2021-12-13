import 'package:flutter/material.dart';
import 'package:furniture_store/Screens/checkout_screen/checkout_screen.dart';
import 'package:furniture_store/Screens/success_screen/success_screen.dart';
import 'package:furniture_store/common/custom_color.dart';
import 'package:furniture_store/controllers/checkout_screen_controller/checkout_screen_controller.dart';
import 'package:get/get.dart';


class ShippingDetails extends StatelessWidget {
  const ShippingDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shipping To',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '7000, WhiteField, Manchester Highway, London, 401203',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 10),
          Container(
            child: IconButton(
              onPressed: () => print('Edit'),
              icon: Icon(
                Icons.edit_rounded,
                color: CustomColor.kLightGreenColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class PaymentMethods extends StatelessWidget {
  CheckOutScreenController checkOutScreenController;
  PaymentMethods({required this.checkOutScreenController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Method',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          GridView.builder(
            itemCount: checkOutScreenController.paymentMethodList.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 2,
            ),
            itemBuilder: (context, index) {
              return Obx(
                    () => GestureDetector(
                  onTap: () {
                    print('$index');
                    checkOutScreenController.isSelectedIndex.value = index;
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color:
                          checkOutScreenController.isSelectedIndex.value ==
                              index
                              ? CustomColor.kLightGreenColor
                              : Colors.grey),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          top: 5,
                          left: 5,
                          child:
                          checkOutScreenController.isSelectedIndex.value ==
                              index
                              ? Container(
                            child: Padding(
                              padding: const EdgeInsets.all(1),
                              child: Icon(Icons.check_rounded,
                                  color: Colors.white, size: 15),
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: CustomColor.kLightGreenColor,
                            ),
                          )
                              : Container(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage(
                                    '${checkOutScreenController.paymentMethodList[index].img}'),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                  '${checkOutScreenController.paymentMethodList[index].name}'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ProceedButton extends StatelessWidget {
  const ProceedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: () => Get.to(()=> SuccessScreen()),
        child: Container(
          color: CustomColor.kLightGreenColor,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                'Proceed To Payment',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
