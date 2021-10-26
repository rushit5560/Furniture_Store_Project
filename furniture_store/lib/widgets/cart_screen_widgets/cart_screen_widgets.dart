import 'package:flutter/material.dart';
import 'package:furniture_store/Screens/checkout_screen/checkout_screen.dart';
import 'package:furniture_store/common/custom_color.dart';
import 'package:furniture_store/controllers/cart_screen_controller/cart_screen_controller.dart';
import 'package:get/get.dart';

class CartItemsListModule extends StatelessWidget {
  CartScreenController cartScreenController;
  CartItemsListModule({required this.cartScreenController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        itemCount: cartScreenController.cartItemList.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        separatorBuilder: (BuildContext context, int index) =>
            Divider(height: 1, thickness: 1),
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          height: Get.height * 0.10,
                          width: Get.height * 0.10,
                          color: Colors.grey.shade300,
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Center(
                              child: Image(
                                image: AssetImage('${cartScreenController.cartItemList[index].img}'),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${cartScreenController.cartItemList[index].title}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),

                                Text(
                                  '${cartScreenController.cartItemList[index].qty} Items',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),

                                Text(
                                    '\$${cartScreenController.cartItemList[index].price}'
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      //Inc & Dec Button
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            GestureDetector(
                              onTap: () {
                                // if(cartItemLists[index].productQty > 1){
                                //   var cartItemDec = cartItemLists[index].productQty - 1;
                                //   print('$cartItemDec');
                                // }
                                print('${cartScreenController.cartItemList[index].qty}');
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.grey),
                                  ),
                                ),
                                child: Icon(
                                  Icons.remove,
                                  size: 22,
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                '${cartScreenController.cartItemList[index].qty}',
                                style: TextStyle(
                                    fontSize: 15
                                ),
                              ),
                            ),

                            GestureDetector(
                              onTap: () {
                                // var cartItemInc = cartScreenController.cartItemList[index].qty + 1;
                                // print('$cartItemInc');
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    left: BorderSide(color: Colors.grey),
                                  ),
                                ),
                                child: Icon(
                                  Icons.add,
                                  size: 22,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: (){
                          print('Clicked on Delete Button on Index $index');
                        },
                        child: Container(
                          child: Icon(
                            Icons.delete_rounded,
                            color: Colors.red,
                            size: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}


class CartPriceModule extends StatelessWidget {
  const CartPriceModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Shipping Fee',
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  '\$10.00',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sub Total',
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  '\$450.00',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
          Divider(thickness: 1),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$460.00',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CheckOutButton extends StatelessWidget {
  const CheckOutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: () => Get.to(()=> CheckOutScreen()),
        child: Container(
          color: CustomColor.kLightGreenColor,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                'Checkout',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
