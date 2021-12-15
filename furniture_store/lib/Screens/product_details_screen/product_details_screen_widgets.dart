import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:furniture_store/Screens/home_screen/home_screen_widgets.dart';
import 'package:furniture_store/common/api_url.dart';
import 'package:furniture_store/common/common_widgets.dart';
import 'package:furniture_store/common/custom_color.dart';
import 'package:furniture_store/common/field_validation.dart';
import 'package:furniture_store/common/text_fields_decorations.dart';
import 'package:furniture_store/controllers/product_details_screen_controller/product_details_screen_controller.dart';
import 'package:furniture_store/models/product_detail_screen_model/get_product_review_model.dart';
import 'package:get/get.dart';

class ProductImageSliderModule extends StatelessWidget {
  ProductImageSliderModule({Key? key}) : super(key: key);
  final productDetailsScreenController =
      Get.find<ProductDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount:
          productDetailsScreenController.productDetailLists[0].images.length,
      itemBuilder: (context, index, realIndex) {
        final imgUrl = ApiUrl.ApiMainPath +
            '${productDetailsScreenController.productDetailLists[0].images[index]}';
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
              image: NetworkImage('$urlImage'), fit: BoxFit.cover)),
    );
  }
}

class ProductImageBannerIndicator extends StatelessWidget {
  ProductImageBannerIndicator({Key? key}) : super(key: key);
  final productDetailsScreenController =
      Get.find<ProductDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          productDetailsScreenController.productDetailLists[0].images.length,
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
}

class FavouriteButton extends StatelessWidget {
  const FavouriteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}

class ProductDetails extends StatelessWidget {
  ProductDetails({Key? key}) : super(key: key);
  final productDetailsScreenController =
      Get.find<ProductDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SpacerHeight(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  '${productDetailsScreenController.productDetailLists[0].productname}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              Text(
                '\$${productDetailsScreenController.productDetailLists[0].productcost}',
                style: TextStyle(
                  color: CustomColor.kLightGreenColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          const SpacerHeight(8),
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
          const SpacerHeight(8),
          CustomDivider(),
          TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Description'),
              Tab(text: 'Reviews'),
              Tab(text: 'Add Review')
            ],
          ),
          CustomDivider(),
          Container(
            height: Get.height * 0.20,
            child: TabBarView(
              children: [
                _productDescription(),
                _productReviews(),
                _addProductReview(),
              ],
            ),
          ),
          NewArrivalModule(),
          _cartAndBuyButton(),
        ],
      ),
    );
  }

  Widget _productDescription() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        '${productDetailsScreenController.productDetailLists[0].fullText}',
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _productReviews() {
    return ListView.builder(
      itemCount: productDetailsScreenController.productReviewList.length,
      itemBuilder: (context, index) {
        Datum1 productSingleReview =
            productDetailsScreenController.productReviewList[index];
        return _productReviewListTile(productSingleReview);
      },
    );
  }

  Widget _productReviewListTile(Datum1 productSingleReview) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '${productSingleReview.username}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        child: RatingBar.builder(
                          itemCount: 5,
                          ignoreGestures: true,
                          unratedColor: CustomColor.kLightOrangeColor,
                          allowHalfRating: true,
                          itemSize: 15,
                          minRating: 1,
                          glow: false,
                          initialRating: productSingleReview.ratings.toDouble(),
                          itemBuilder: (context, _) {
                            return Icon(
                              Icons.star_rounded,
                              color: CustomColor.kOrangeColor,
                            );
                          },
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: Text(
                      productSingleReview.comment,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _addProductReview() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: RatingBar.builder(
              itemCount: 5,
              unratedColor: CustomColor.kLightOrangeColor,
              allowHalfRating: true,
              itemSize: 18,
              minRating: 1,
              glow: false,
              initialRating: 0,
              itemBuilder: (context, _) {
                return Icon(
                  Icons.star_rounded,
                  color: CustomColor.kOrangeColor,
                );
              },
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
          ),
          SpacerHeight(5),
          TextFormField(
            controller: productDetailsScreenController.reviewAddFieldController,
            validator: (value) => FieldValidator().validateFullName(value!),
            maxLines: 3,
            decoration: addReviewFieldDecoration(hintText: 'Comment'),
          ),
          SpacerHeight(5),
          Container(
            decoration: BoxDecoration(color: CustomColor.kDarkGreenColor),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                'Submit',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
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
            onTap: () => productDetailsScreenController.productAddToCart(),
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
