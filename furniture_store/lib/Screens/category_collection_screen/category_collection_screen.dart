import 'package:flutter/material.dart';
import 'package:furniture_store/common/common_widgets.dart';

import 'category_collection_screen_widgets.dart';

class CategoryCollectionScreen extends StatelessWidget {
  const CategoryCollectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: 'Product List'),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CategoryCollectionList(),
      ),
    );
  }
}
