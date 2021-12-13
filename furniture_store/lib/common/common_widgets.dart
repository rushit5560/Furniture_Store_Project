import 'package:flutter/material.dart';
import 'package:furniture_store/Screens/cart_screen/cart_screen.dart';
import 'package:get/get.dart';

import 'custom_color.dart';
import 'image_url.dart';

PreferredSizeWidget commonAppBarModule({required String title, int index = 0}) {
  return AppBar(
    title: Text('$title'),
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(bottomRight: Radius.circular(45)),
    ),
    centerTitle: true,

    actions: [
      index == 1
          ? IconButton(
              onPressed: () {
                Get.to(() => CartScreen());
              },
              icon: Icon(Icons.shopping_cart_rounded),
            )
          : Container(),
      SizedBox(width: 8),
    ],
  );
}

class SignInOrSignOutWelcomeText extends StatelessWidget {
  const SignInOrSignOutWelcomeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Welcome To Furnica',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }
}

class SignInOrSignUpWithText extends StatelessWidget {
  final text;
  SignInOrSignUpWithText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$text',
      style: TextStyle(
        fontWeight: FontWeight.bold,

      ),
    );
  }
}

class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        GestureDetector(
          onTap: () => print('Facebook Login'),
          child: Container(
            height: Get.height * 0.05,
            width: Get.height * 0.05,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              image: DecorationImage(
                image: AssetImage('${ImageUrl.facebook}'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        const SizedBox(width: 15),

        GestureDetector(
          onTap: () => print('Google Login'),
          child: Container(
            height: Get.height * 0.05,
            width: Get.height * 0.05,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              image: DecorationImage(
                image: AssetImage('${ImageUrl.google}'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}


class SpacerHeight extends StatelessWidget {
  final double value;
  const SpacerHeight(this.value);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: value);
  }
}

class SpacerWidth extends StatelessWidget {
  final double value;
  const SpacerWidth(this.value);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: value);
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider();
  @override
  Widget build(BuildContext context) {
    return Divider(thickness: 1);
  }
}
class CustomCircularProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      color: Colors.transparent,
      child: Center(
        child: CircularProgressIndicator(
          color: CustomColor.kDarkGreenColor,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}