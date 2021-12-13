import 'package:flutter/material.dart';

import 'collection_screen_widgets.dart';

class CollectionScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: appBarModule('Collections'),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ProductCollectionListModule(),
      ),
    );
  }
}
