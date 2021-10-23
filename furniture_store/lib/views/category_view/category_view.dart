import 'package:flutter/material.dart';
import 'package:furniture_store/controllers/category_view_controller/category_view_controller.dart';
import 'package:furniture_store/views/product_collection_view/product_collection_view.dart';
import 'package:furniture_store/widgets/category_view_widgets/category_view_widgets.dart';
import 'package:get/get.dart';

class CategoryView extends StatelessWidget {
  // const CategoryView({Key? key}) : super(key: key);

  CategoryViewController categoryViewController = Get.put(CategoryViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: appBarModule(),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemCount: categoryViewController.categoryList.length,
          separatorBuilder: (BuildContext context, int index) => Divider(height: 1,thickness: 1,),
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: GestureDetector(
                onTap: () {
                  print('$index');
                  Get.to(()=>
                      ProductCollectionView(),
                    transition: Transition.rightToLeft,
                    arguments: categoryViewController.categoryList[index].categoryName,
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Container(
                            color: Colors.grey.shade300,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: Get.height * 0.08,
                                height: Get.height * 0.08,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('${categoryViewController.categoryList[index].img}'),
                                    // fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(width: 10),

                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${categoryViewController.categoryList[index].categoryName}',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '${categoryViewController.categoryList[index].itemsCount} Items'
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Icon(Icons.arrow_forward_ios_rounded,size: 20),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
