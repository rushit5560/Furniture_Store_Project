import 'package:flutter/material.dart';
import 'package:furniture_store/controllers/product_collection_view_controller/product_collection_view_controller.dart';
import 'package:furniture_store/widgets/product_collection_view_widgets/product_collection_view_widgets.dart';

import 'package:get/get.dart';

class ProductCollectionView extends StatelessWidget {
  // const ProductCollectionView({Key? key}) : super(key: key);

  ProductCollectionViewController productCollectionViewController = Get.put(ProductCollectionViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: appBarModule('${productCollectionViewController.categoryName}'),
    );
  }
}
