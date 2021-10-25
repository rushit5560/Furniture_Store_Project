import 'package:furniture_store/common/image_url.dart';
import 'package:furniture_store/models/home_screen_model/category_model.dart';
import 'package:furniture_store/models/home_screen_model/trending_model.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  var activeIndex = 0.obs;
  List<String> bannerList = [ImageUrl.bannerImg, ImageUrl.bannerImg, ImageUrl.bannerImg];
  List<CategoryModel> categoryList = [
    CategoryModel(img: ImageUrl.category1, name: 'Chair'),
    CategoryModel(img: ImageUrl.category2, name: 'Sofas'),
    CategoryModel(img: ImageUrl.category3, name: 'Table'),
    CategoryModel(img: ImageUrl.category4, name: 'Stool'),
    CategoryModel(img: ImageUrl.category5, name: 'Cupboard'),
    CategoryModel(img: ImageUrl.category1, name: 'Chair'),
    CategoryModel(img: ImageUrl.category2, name: 'Sofas'),
    CategoryModel(img: ImageUrl.category3, name: 'Table'),
    CategoryModel(img: ImageUrl.category4, name: 'Stool'),
    CategoryModel(img: ImageUrl.category5, name: 'Cupboard'),
  ];
  List<TrendingModel> trendingList = [
    TrendingModel(
      img: ImageUrl.product1,
      name: 'Vestibulum non pretium Felis',
      activePrice: '199',
      deActivePrice: '299',
    ),
    TrendingModel(
      img: ImageUrl.product2,
      name: 'Vestibulum non pretium Felis',
      activePrice: '199',
      deActivePrice: '299',
    ),
    TrendingModel(
      img: ImageUrl.product3,
      name: 'Vestibulum non pretium Felis',
      activePrice: '199',
      deActivePrice: '299',
    ),
    TrendingModel(
      img: ImageUrl.product2,
      name: 'Vestibulum non pretium Felis',
      activePrice: '199',
      deActivePrice: '299',
    ),
  ];

}