import 'package:furniture_store/common/image_url.dart';
import 'package:furniture_store/models/product_collection_screen_model/product_collection_screen_model.dart';
import 'package:get/get.dart';

class ProductCollectionScreenController extends GetxController {
  String categoryName = Get.arguments;

  List<ProductCollectionModel> productCollectionList = [
    ProductCollectionModel(
      img: ImageUrl.product1,
      name: 'Vestibulum non pretium Felis',
      activePrice: '259',
      deActivePrice: '399'
    ),
    ProductCollectionModel(
        img: ImageUrl.product2,
        name: 'Vestibulum non pretium Felis',
        activePrice: '259',
        deActivePrice: '399'
    ),
    ProductCollectionModel(
        img: ImageUrl.product3,
        name: 'Vestibulum non pretium Felis',
        activePrice: '259',
        deActivePrice: '399'
    ),
    ProductCollectionModel(
        img: ImageUrl.product1,
        name: 'Vestibulum non pretium Felis',
        activePrice: '259',
        deActivePrice: '399'
    ),
    ProductCollectionModel(
        img: ImageUrl.product2,
        name: 'Vestibulum non pretium Felis',
        activePrice: '259',
        deActivePrice: '399'
    ),
    ProductCollectionModel(
        img: ImageUrl.product3,
        name: 'Vestibulum non pretium Felis',
        activePrice: '259',
        deActivePrice: '399'
    ),
    ProductCollectionModel(
        img: ImageUrl.product1,
        name: 'Vestibulum non pretium Felis',
        activePrice: '259',
        deActivePrice: '399'
    ),
    ProductCollectionModel(
        img: ImageUrl.product2,
        name: 'Vestibulum non pretium Felis',
        activePrice: '259',
        deActivePrice: '399'
    ),
    ProductCollectionModel(
        img: ImageUrl.product3,
        name: 'Vestibulum non pretium Felis',
        activePrice: '259',
        deActivePrice: '399'
    ),
    ProductCollectionModel(
        img: ImageUrl.product1,
        name: 'Vestibulum non pretium Felis',
        activePrice: '259',
        deActivePrice: '399'
    ),
    ProductCollectionModel(
        img: ImageUrl.product2,
        name: 'Vestibulum non pretium Felis',
        activePrice: '259',
        deActivePrice: '399'
    ),
    ProductCollectionModel(
        img: ImageUrl.product3,
        name: 'Vestibulum non pretium Felis',
        activePrice: '259',
        deActivePrice: '399'
    ),
  ];
}