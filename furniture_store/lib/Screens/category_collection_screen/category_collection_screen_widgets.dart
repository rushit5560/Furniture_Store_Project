import 'package:flutter/material.dart';
import 'package:furniture_store/Screens/product_details_screen/product_details_screen.dart';
import 'package:furniture_store/common/api_url.dart';
import 'package:furniture_store/common/common_widgets.dart';
import 'package:furniture_store/common/custom_color.dart';
import 'package:furniture_store/controllers/category_collection_screen_controller/category_collection_screen_controller.dart';
import 'package:furniture_store/models/category_collection_screen_model/category_collection_model.dart';
import 'package:get/get.dart';

class CategoryCollectionList extends StatelessWidget {
  const CategoryCollectionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryCollectionScreenController>(
      init: CategoryCollectionScreenController(),
      builder: (controller) {
        return controller.isLoading.value
            ? CustomCircularProgressIndicator()
            : collectionList(controller);
      }
      ,
    );
  }

  Widget collectionList(CategoryCollectionScreenController controller) {
    return GridView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: controller.categoryCollectionLists.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index){
        Datum collectionSingleItem = controller.categoryCollectionLists[index];
        return _collectionListTile(collectionSingleItem);
      },
    );
  }

  Widget _collectionListTile(Datum collectionSingleItem) {
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
