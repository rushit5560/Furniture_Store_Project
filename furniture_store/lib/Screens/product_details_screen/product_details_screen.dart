import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:furniture_store/common/common_widgets.dart';
import 'package:furniture_store/common/custom_color.dart';
import 'package:furniture_store/controllers/home_screen_controller/home_screen_controller.dart';
import 'package:furniture_store/controllers/product_details_screen_controller/product_details_screen_controller.dart';
import 'package:furniture_store/widgets/home_screen_widgets/home_screen_widgets.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreenController productDetailsScreenController
   = Get.put(ProductDetailsScreenController());
  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: commonAppBarModule(title: '',index: 1),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                clipBehavior: Clip.none,
                children: [
                  _carouselSlider(),
                  Positioned(
                    bottom: 5,
                      child: _carouselIndicator(),
                  ),
                  Positioned(
                    right: 12,
                      bottom: -12,
                      child: _favoriteButton(),
                  ),
                ],
              ),

              _productDetails(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _carouselSlider() {
    return CarouselSlider.builder(
      itemCount: productDetailsScreenController.productImgList.length,
      itemBuilder: (context, index, realIndex) {
        final imgUrl = '${productDetailsScreenController.productImgList[index]}';
        return _buildImage(imgUrl, index);
      },
      options: CarouselOptions(
          height: Get.height * 0.30,
          autoPlay: true,
          // autoPlayInterval: Duration(seconds: 3),
          viewportFraction: 1,
          onPageChanged: (index, reason) {
            productDetailsScreenController.activeIndex.value = index;
          }),
    );
  }

  Widget _buildImage(String urlImage, int index) {
    return Container(
      height: Get.height * 0.20,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        image: DecorationImage(
          image: AssetImage('$urlImage'),
        )
      ),
    );
  }

  Widget _carouselIndicator() {
    return Obx(
          () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          productDetailsScreenController.productImgList.length,
              (index) => Container(
            margin: EdgeInsets.all(4),
            width: 11,
            height: 11,
            decoration: BoxDecoration(
              color: productDetailsScreenController.activeIndex.value == index
                  ? CustomColor.kLightGreenColor
                  : Colors.grey,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }

  Widget _favoriteButton() {
    return GestureDetector(
      onTap: () => print('Clk'),
      child: Material(
        borderRadius: BorderRadius.circular(40),
        elevation: 10,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Icon(
              Icons.favorite_rounded,
              color: CustomColor.kLightGreenColor,
              size: 18,
            ),
          ),
        ),
      ),
    );
  }

  Widget _productDetails() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Expanded(
                child: Text(
                  'Vestibulum non pretium Felis Vestibulum non pretium Felis',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15
                  ),
                ),
              ),

              Text(
                '\$200',
                style: TextStyle(
                  color: CustomColor.kLightGreenColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.star_rounded, color: Colors.yellowAccent),
              const SizedBox(width: 10),
              Text('4.5 '),
              Text(
                'review',
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ],
          ),
          const SizedBox(height: 8),

          Divider(height: 1,thickness: 1),
          TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                text: 'Description',
              ),
              Tab(
                text: 'review',
              ),
            ],
          ),
          Divider(height: 1,thickness: 1),
          Container(
            height: Get.height * 0.20,
            child: TabBarView(
              children: [
                _productDescription(),
                _productDescription(),
              ],
            ),
          ),

          NewArrivalModule(homeScreenController: homeScreenController),

          _cartAndBuyButton(),
        ],
      ),
    );
  }

  Widget _productDescription() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'Vestibulum non pretium Felis Vestibulum non pretium Felis Vestibulum non pretium Felis Vestibulum non pretium Felis Vestibulum non pretium Felis Vestibulum non pretium Felis Vestibulum non pretium Felis Vestibulum non pretium Felis Vestibulum non pretium Felis Vestibulum non pretium Felis Vestibulum non pretium Felis Vestibulum non pretium Felis',
        maxLines: 5,
        overflow: TextOverflow.ellipsis,

      ),
    );
  }

  Widget _cartAndBuyButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          GestureDetector(
            onTap: () {},
            child: Container(
              width: Get.width * 0.30,
              color: CustomColor.kLightGreenColor,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Add To Cart',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
          ),

          GestureDetector(
            onTap: () {},
            child: Container(
              width: Get.width * 0.30,
              color: CustomColor.kLightGreenColor,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Buy',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
