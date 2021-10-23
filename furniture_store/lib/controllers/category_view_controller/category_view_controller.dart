import 'package:furniture_store/common/image_url.dart';
import 'package:furniture_store/models/category_view_model/category_view_model.dart';
import 'package:get/get.dart';

class CategoryViewController extends GetxController {
  List<CategoryModel> categoryList = [
    CategoryModel(
      img: ImageUrl.category1,
      categoryName: 'Cupboard',
      itemsCount: '1099'
    ),
    CategoryModel(
        img: ImageUrl.category2,
        categoryName: 'Sofa Chair',
        itemsCount: '1099'
    ),
    CategoryModel(
        img: ImageUrl.category3,
        categoryName: 'Sideboard',
        itemsCount: '1099'
    ),
    CategoryModel(
        img: ImageUrl.category4,
        categoryName: 'Nightstand',
        itemsCount: '1099'
    ),
    CategoryModel(
        img: ImageUrl.category5,
        categoryName: 'Nightstand',
        itemsCount: '1099'
    ),
    CategoryModel(
        img: ImageUrl.category1,
        categoryName: 'Cupboard',
        itemsCount: '1099'
    ),
    CategoryModel(
        img: ImageUrl.category2,
        categoryName: 'Sofa Chair',
        itemsCount: '1099'
    ),
    CategoryModel(
        img: ImageUrl.category3,
        categoryName: 'Sideboard',
        itemsCount: '1099'
    ),
    CategoryModel(
        img: ImageUrl.category4,
        categoryName: 'Nightstand',
        itemsCount: '1099'
    ),
    CategoryModel(
        img: ImageUrl.category5,
        categoryName: 'Nightstand',
        itemsCount: '1099'
    ),
  ];
}