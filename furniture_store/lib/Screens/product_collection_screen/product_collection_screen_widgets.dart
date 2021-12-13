import 'package:flutter/material.dart';
import 'package:furniture_store/common/custom_color.dart';
import 'package:furniture_store/controllers/product_collection_screen_controller/product_collection_screen_controller.dart';

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
  ProductCollectionScreenController productCollectionScreenController;
  ProductCollectionListModule(
      {required this.productCollectionScreenController});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: productCollectionScreenController.productCollectionList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index){
        return Container(
          padding: EdgeInsets.all(10),
          color: Colors.grey.shade300,
          child: Column(
            children: [
              Expanded(
                flex: 68,
                child: Image(
                  image: AssetImage(
                      '${productCollectionScreenController.productCollectionList[index].img}'),
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
                        '${productCollectionScreenController.productCollectionList[index].name}',
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
                              '\$${productCollectionScreenController.productCollectionList[index].activePrice}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: CustomColor.kLightGreenColor,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              '\$${productCollectionScreenController.productCollectionList[index].deActivePrice}',
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
        );
      },
    );
  }
}
