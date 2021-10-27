import 'dart:async';

import 'package:flutter/material.dart';
import 'package:furniture_store/common/common_widgets.dart';
import 'package:furniture_store/common/custom_color.dart';
import 'package:furniture_store/controllers/order_track_screen_controller/order_track_screen_controller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderTrackScreen extends StatelessWidget {
  // const OrderTrackScreen({Key? key}) : super(key: key);

  OrderTrackScreenController orderTrackScreenController = Get.put(OrderTrackScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: 'Order Track'),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _map(),
            _orderTrackingModule(),
          ],
        ),
      ),
    );
  }

  Widget _map() {

    final CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(21.1860, 72.7944),
      zoom: 7,
    );
    Completer<GoogleMapController> _controller = Completer();

    return Container(
      height: Get.height * 0.25,
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        myLocationEnabled: true,
      ),
    );
  }

  Widget _orderTrackingModule() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Obx(
                  () => GestureDetector(
                    onTap: () {
                      orderTrackScreenController.isOrderReceived.value = true;
                    },
                    child: orderTrackScreenController.isOrderReceived.value
                        ? Container(
                            height: Get.width * 0.06,
                            width: Get.width * 0.06,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: CustomColor.kLightGreenColor,
                            ),
                            child:
                                Icon(Icons.check_rounded, color: Colors.white),
                          )
                        : Container(
                            height: Get.width * 0.06,
                            width: Get.width * 0.06,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: CustomColor.kLightGreenColor),
                            ),
                          ),
                  ),
                ),
                const SizedBox(width: 20),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order Received',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(Icons.access_time, size: 16),
                          Text(' 8:30'),
                          const SizedBox(width: 10),
                          Text('8/2/2019'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          _customDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Obx(
                  () => GestureDetector(
                    onTap: () {
                      orderTrackScreenController.isOrderOnTheWay.value = true;
                    },
                    child: orderTrackScreenController.isOrderOnTheWay.value
                        ? Container(
                            height: Get.width * 0.06,
                            width: Get.width * 0.06,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: CustomColor.kLightGreenColor,
                            ),
                            child:
                                Icon(Icons.check_rounded, color: Colors.white),
                          )
                        : Container(
                            height: Get.width * 0.06,
                            width: Get.width * 0.06,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: CustomColor.kLightGreenColor),
                            ),
                          ),
                  ),
                ),
                const SizedBox(width: 20),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'On The Way',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(Icons.access_time, size: 16),
                          Text(' 10:23'),
                          const SizedBox(width: 10),
                          Text('9/2/2019'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          _customDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Obx(
                  () => GestureDetector(
                    onTap: () {
                      orderTrackScreenController.isOrderDelivered.value = true;
                    },
                    child: orderTrackScreenController.isOrderDelivered.value
                        ? Container(
                            height: Get.width * 0.06,
                            width: Get.width * 0.06,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: CustomColor.kLightGreenColor,
                            ),
                            child:
                                Icon(Icons.check_rounded, color: Colors.white),
                          )
                        : Container(
                            height: Get.width * 0.06,
                            width: Get.width * 0.06,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: CustomColor.kLightGreenColor),
                            ),
                          ),
                  ),
                ),
                const SizedBox(width: 20),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Delivered',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(Icons.access_time, size: 16),
                          Text(' 12:30'),
                          const SizedBox(width: 10),
                          Text('10/2/2019'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          _customDivider(),
        ],
      ),
    );
  }

  Widget _customDivider() {
    return Divider(thickness: 1);
  }
}
