import 'package:flutter/material.dart';
import 'package:furniture_store/Screens/collection_screen/collection_screen.dart';
import 'package:furniture_store/common/api_url.dart';
import 'package:furniture_store/common/common_widgets.dart';
import 'package:furniture_store/controllers/category_screen_controller/category_screen_controller.dart';
import 'package:furniture_store/Screens/category_screen/category_screen_widgets.dart';
import 'package:furniture_store/models/category_screen_model/category_model.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  final categoryScreenController = Get.put(CategoryScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarModule(),
      body: Obx(
        () => categoryScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemCount: categoryScreenController.categoryLists.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(height: 1, thickness: 1),
                  itemBuilder: (context, index) {
                    Datum categorySingleItem =
                        categoryScreenController.categoryLists[index];
                    return _categoryListTile(categorySingleItem);
                  },
                ),
              ),
      ),
    );
  }

  Widget _categoryListTile(Datum categorySingleItem) {
    final imgUrl = ApiUrl.ApiMainPath + '${categorySingleItem.showimg}';
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          Get.to(
            () => CollectionScreen(),
            transition: Transition.rightToLeft,
            arguments: categorySingleItem.categoryName,
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
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
                              image: NetworkImage('$imgUrl'),
                              // fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${categorySingleItem.categoryName}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text('1021 Items'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Icon(Icons.arrow_forward_ios_rounded, size: 20),
            ),
          ],
        ),
      ),
    );
  }
}
