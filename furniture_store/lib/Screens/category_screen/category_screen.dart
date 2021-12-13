import 'package:flutter/material.dart';
import 'package:furniture_store/Screens/product_collection_screen/product_collection_screen.dart';
import 'package:furniture_store/controllers/category_screen_controller/category_screen_controller.dart';
import 'package:furniture_store/Screens/category_screen/category_screen_widgets.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  // const CategoryView({Key? key}) : super(key: key);

  CategoryScreenController categoryScreenController = Get.put(CategoryScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: appBarModule(),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemCount: categoryScreenController.categoryList.length,
          separatorBuilder: (BuildContext context, int index) => Divider(height: 1,thickness: 1,),
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: GestureDetector(
                onTap: () {
                  print('$index');
                  Get.to(()=>
                      ProductCollectionScreen(),
                    transition: Transition.rightToLeft,
                    arguments: categoryScreenController.categoryList[index].categoryName,
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
                                    image: AssetImage('${categoryScreenController.categoryList[index].img}'),
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
                                  '${categoryScreenController.categoryList[index].categoryName}',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '${categoryScreenController.categoryList[index].itemsCount} Items'
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
