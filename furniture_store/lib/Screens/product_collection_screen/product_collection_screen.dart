import 'package:flutter/material.dart';
import 'package:furniture_store/controllers/product_collection_screen_controller/product_collection_screen_controller.dart';
import 'package:furniture_store/Screens/product_collection_screen/product_collection_screen_widgets.dart';

import 'package:get/get.dart';

class ProductCollectionScreen extends StatelessWidget {
  // const ProductCollectionView({Key? key}) : super(key: key);

  ProductCollectionScreenController productCollectionScreenController = Get.put(ProductCollectionScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: appBarModule('${productCollectionScreenController.categoryName}'),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ProductCollectionListModule(productCollectionScreenController: productCollectionScreenController),
      ),
    );
  }
}
