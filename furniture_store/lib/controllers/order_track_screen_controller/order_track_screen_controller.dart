import 'package:get/get.dart';

class OrderTrackScreenController extends GetxController {
  RxBool isOrderReceived = false.obs;
  RxBool isOrderOnTheWay = false.obs;
  RxBool isOrderDelivered = false.obs;
}