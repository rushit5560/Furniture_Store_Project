import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:furniture_store/common/custom_color.dart';
import 'package:furniture_store/controllers/home_view_controller/home_view_controller.dart';
import 'package:furniture_store/views/product_collection_view/product_collection_view.dart';
import 'package:get/get.dart';

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
        onPressed: () {
          print('Clk');
        },
        icon: Icon(Icons.shopping_cart_rounded),
      ),
      SizedBox(width: 8),
    ],
  );
}

class CarouselSliderModule extends StatelessWidget {
  HomeViewController homeViewController;
  CarouselSliderModule({required this.homeViewController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CarouselSlider.builder(
        itemCount: homeViewController.bannerList.length,
        itemBuilder: (context, index, realIndex) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(homeViewController.bannerList[index]),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        options: CarouselOptions(
            height: 150,
            autoPlay: true,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              homeViewController.activeIndex.value = index;
            }),
      ),
    );
  }
}

class SearchTextFieldModule extends StatelessWidget {
  TextEditingController searchFieldController;
  SearchTextFieldModule({required this.searchFieldController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: searchFieldController,
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
              searchFieldController.clear();
              FocusScope.of(context).requestFocus(new FocusNode());
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
  HomeViewController homeViewController;

  CategoryModule({required this.homeViewController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Category Text & ViewALl Text Module
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Categories',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              GestureDetector(
                onTap: () {
                  print('View All Clk');
                },
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
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: homeViewController.categoryList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(()=>
                          ProductCollectionView(),
                        transition: Transition.rightToLeft,
                        arguments: homeViewController.categoryList[index].name,
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
                            image: AssetImage(
                                '${homeViewController.categoryList[index].img}'),
                            fit: BoxFit.cover,
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            '${homeViewController.categoryList[index].name}',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class TrendingModule extends StatelessWidget {
  HomeViewController homeViewController;
  TrendingModule({required this.homeViewController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Trending',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              GestureDetector(
                onTap: () {
                  print('View All Clk');
                },
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
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: homeViewController.trendingList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
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
                              '${homeViewController.trendingList[index].img}'
                          ),
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
                                '${homeViewController.trendingList[index].name}',
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
                                      '\$${homeViewController.trendingList[index].activePrice}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: CustomColor.kLightGreenColor,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      '\$${homeViewController.trendingList[index].deActivePrice}',
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
            ),
          ),
        ),
      ],
    );
  }
}

class NewArrivalModule extends StatelessWidget {
  HomeViewController homeViewController;
  NewArrivalModule({required this.homeViewController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Trending',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              GestureDetector(
                onTap: () {
                  print('View All Clk');
                },
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
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            height: 60,
            child: ListView.builder(
              itemCount: homeViewController.trendingList.length,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: Get.width * 0.45,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey.shade300,
                          width: 1.5
                      ),
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
                                  image: AssetImage(
                                      '${homeViewController.trendingList[index].img}'
                                  ),

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
                                  '${homeViewController.trendingList[index].name}',
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
                                      '\$${homeViewController.trendingList[index].activePrice}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: CustomColor.kLightGreenColor,
                                        fontSize: 12,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      '\$${homeViewController.trendingList[index].deActivePrice}',
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
              },
            ),
          ),
        ),
      ],
    );
  }
}
