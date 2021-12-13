import 'package:flutter/material.dart';
import 'package:furniture_store/Screens/product_details_screen/product_details_screen.dart';
import 'package:furniture_store/common/api_url.dart';
import 'package:furniture_store/common/common_widgets.dart';
import 'package:furniture_store/common/custom_color.dart';
import 'package:furniture_store/controllers/collection_screen_controller/collection_screen_controller.dart';
import 'package:furniture_store/models/collection_screen_model/collection_model.dart';
import 'package:get/get.dart';

PreferredSizeWidget appBarModule(String title) {
  return AppBar(
    title: Text('$title'),
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(bottomRight: Radius.circular(45)),
    ),
    centerTitle: true,

  );
}


class ProductCollectionListModule extends StatelessWidget {
  // final productCollectionScreenController = Get.find<ProductCollectionScreenController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CollectionScreenController>(
      init: CollectionScreenController(),
      builder: (controller) {
        return controller.isLoading.value
            ? CustomCircularProgressIndicator()
            : collectionList(controller);
      }
      ,
    );
  }

  Widget collectionList(CollectionScreenController controller) {
    return GridView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: controller.collectionLists.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index){
        Datum1 collectionSingleItem = controller.collectionLists[index];
        return _collectionListTile(collectionSingleItem);
      },
    );
  }

  Widget _collectionListTile(Datum1 collectionSingleItem) {
    final imgUrl = ApiUrl.ApiMainPath + '${collectionSingleItem.showimg}';
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetailsScreen(),
            arguments: collectionSingleItem.id);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        color: Colors.grey.shade300,
        child: Column(
          children: [
            Expanded(
              flex: 68,
              child: Image(
                image: NetworkImage('$imgUrl'),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 3),
            Expanded(
              flex: 32,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${collectionSingleItem.productname}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: Row(
                        children: [
                          Text(
                            '\$${collectionSingleItem.productcost}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: CustomColor.kLightGreenColor,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            '\$${collectionSingleItem.productcost}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


