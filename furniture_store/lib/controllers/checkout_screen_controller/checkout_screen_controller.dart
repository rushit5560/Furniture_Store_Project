import 'package:furniture_store/common/image_url.dart';
import 'package:furniture_store/models/checkout_screen_model/checkout_screen_model.dart';
import 'package:get/get.dart';

class CheckOutScreenController extends GetxController {
  RxInt isSelectedIndex = 0.obs;

  List<CheckOutPaymentModel> paymentMethodList = [
    CheckOutPaymentModel(
      img: ImageUrl.mastercard,
      name: 'Master Card'
    ),
    CheckOutPaymentModel(
        img: ImageUrl.paypal,
        name: 'Paypal'
    ),
    CheckOutPaymentModel(
        img: ImageUrl.visa,
        name: 'Visa Card'
    ),
    CheckOutPaymentModel(
        img: ImageUrl.cod,
        name: 'Cash On Delivery'
    ),
  ];
}