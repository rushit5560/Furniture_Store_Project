import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:furniture_store/Screens/cart_screen/cart_screen.dart';
import 'package:furniture_store/Screens/category_screen/category_screen.dart';
import 'package:furniture_store/Screens/collection_screen/collection_screen.dart';
import 'package:furniture_store/Screens/product_details_screen/product_details_screen.dart';
import 'package:furniture_store/common/api_url.dart';
import 'package:furniture_store/common/common_functions.dart';
import 'package:furniture_store/common/custom_color.dart';
import 'package:furniture_store/controllers/home_screen_controller/home_screen_controller.dart';
import 'package:furniture_store/models/home_screen_model/category_model.dart';
import 'package:furniture_store/models/home_screen_model/trending_model.dart';
import 'package:get/get.dart';

enum HeadingModules {category, trending, newArrivals}

PreferredSizeWidget appBarModule() {
  return AppBar(
    title: Text('FIXTURES'),
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(bottomRight: Radius.circular(45)),
    ),
    // centerTitle: true,

    actions: [
      IconButton(
        onPressed: () => Get.to(() => CartScreen()),
        icon: Icon(Icons.shopping_cart_rounded),
      ),
      SizedBox(width: 8),
    ],
  );
}

class BannerImageSliderModule extends StatelessWidget {
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CarouselSlider.builder(
        itemCount: homeScreenController.bannerLists.length,
        itemBuilder: (context, index, realIndex) {
          final imgUrl = ApiUrl.ApiMainPath +
              "${homeScreenController.bannerLists[index].imagePath}";
          return _bannerListTile(imgUrl);
        },
        options: CarouselOptions(
            height: 150,
            autoPlay: true,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              homeScreenController.activeIndex.value = index;
            }),
      ),
    );
  }

  Widget _bannerListTile(String imgUrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("$imgUrl"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class SearchTextFieldModule extends StatelessWidget {
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: homeScreenController.searchFieldController,
        keyboardType: TextInputType.text,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: 'Search',
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              homeScreenController.searchFieldController.clear();
              CommonFunctions().hideKeyBoard();
            },
            icon: Icon(Icons.search_rounded),
            color: CustomColor.kLightGreenColor,
          ),
        ),
      ),
    );
  }
}

class CategoryModule extends StatelessWidget {
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Category Text & ViewALl Text Module
        HeadingModule(heading: "Categories",headingModule: HeadingModules.category),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: homeScreenController.categoryList.length,
              itemBuilder: (context, index) {
                CategoryModel categorySingleItem =
                    homeScreenController.categoryList[index];
                return _categoryListTile(categorySingleItem);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _categoryListTile(CategoryModel categorySingleItem) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: () {
          Get.to(
            () => CollectionScreen(),
            transition: Transition.rightToLeft,
            arguments: categorySingleItem.name,
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('${categorySingleItem.img}'),
                fit: BoxFit.cover,
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                '${categorySingleItem.name}',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TrendingModule extends StatelessWidget {
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeadingModule(heading: 'Trending', headingModule: HeadingModules.trending),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: homeScreenController.trendingList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                TrendingModel trendingSingleItem =
                    homeScreenController.trendingList[index];
                return _trendingListTile(trendingSingleItem);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _trendingListTile(TrendingModel trendingSingleItem) {
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailsScreen()),
      child: Container(
        padding: EdgeInsets.all(10),
        color: Colors.grey.shade300,
        child: Column(
          children: [
            Expanded(
              flex: 68,
              child: Image(
                image: AssetImage('${trendingSingleItem.img}'),
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
                      '${trendingSingleItem.name}',
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
                            '\$${trendingSingleItem.activePrice}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: CustomColor.kLightGreenColor,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            '\$${trendingSingleItem.deActivePrice}',
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

class NewArrivalModule extends StatelessWidget {
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeadingModule(heading: 'New Arrivals', headingModule: HeadingModules.newArrivals),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            height: 60,
            child: ListView.builder(
              itemCount: homeScreenController.trendingList.length,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                TrendingModel newArrivalSingleItem =
                    homeScreenController.trendingList[index];
                return _newArrivalsListTile(newArrivalSingleItem);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _newArrivalsListTile(TrendingModel newArrivalSingleItem) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: Get.width * 0.45,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300, width: 1.5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 35,
                child: Container(
                  color: Colors.grey.shade300,
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Image(
                      image: AssetImage('${newArrivalSingleItem.img}'),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                flex: 65,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${newArrivalSingleItem.name}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '\$${newArrivalSingleItem.activePrice}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: CustomColor.kLightGreenColor,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '\$${newArrivalSingleItem.deActivePrice}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.lineThrough,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HeadingModule extends StatelessWidget {
  final heading;
  final headingModule;
  HeadingModule({required this.heading, required this.headingModule});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$heading',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          GestureDetector(
            onTap: () => moveToNext(),
            child: Text(
              'View All',
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void moveToNext() {
    switch(headingModule){
      case(HeadingModules.category):
        Get.to(()=> CategoryScreen());
        break;
      case(HeadingModules.trending):
        Get.to(()=> CollectionScreen());
        break;
      case(HeadingModules.newArrivals):
        Get.to(()=> CollectionScreen());
        break;
      default:
        Get.to(()=> CategoryScreen());
        break;
    }

  }
}
