import 'package:flutter/material.dart';
import 'package:furniture_store/Screens/category_screen/category_screen.dart';
import 'package:furniture_store/Screens/sign_in_screen/sign_in_screen.dart';
import 'package:furniture_store/common/custom_color.dart';
import 'package:furniture_store/common/image_url.dart';
import 'package:get/get.dart';

class CustomDrawerScreen extends StatelessWidget {
  // const CustomDrawerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        profilePictureModule(),

                        Transform(
                          transform: Matrix4.translationValues(0, -35, 0),
                          child: Container(
                            child: Column(
                              children: [
                                Container(
                                  width: Get.width * 0.20,
                                  height: Get.width * 0.20,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: AssetImage('${ImageUrl.profileImg}'),
                                        fit: BoxFit.cover,
                                      )
                                  ),
                                ),
                                SizedBox(height: 5),
                                homeButton(),
                                Divider(color: Colors.grey),
                                categoryButton(),
                                Divider(color: Colors.grey),
                                notificationButton(),
                                Divider(color: Colors.grey),
                                profileButton(),
                                Divider(color: Colors.grey),
                                contactUsButton(),
                                Divider(color: Colors.grey),
                                settingsButton(),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Divider(
                  color: CustomColor.kLightGreenColor,
                  thickness: 2,
                  indent: 15,
                  endIndent: 15,
                ),
                loginButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget homeButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: () {print('Home');},
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 10),
              child: Icon(Icons.home_rounded),
            ),
            Text('Home', textScaleFactor: 1.2),
          ],
        ),
      ),
    );
  }

  Widget categoryButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: () {
          Get.back();
          Get.to(()=> CategoryScreen());
          },
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 10),
              child: Icon(Icons.category_rounded),
            ),
            Text('Category', textScaleFactor: 1.2),
          ],
        ),
      ),
    );
  }

  Widget notificationButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: () {print('Notification');},
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 10),
              child: Icon(Icons.notifications_rounded),
            ),
            Text('Notification', textScaleFactor: 1.2),
          ],
        ),
      ),
    );
  }

  Widget profileButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: () {print('Profile');},
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 10),
              child: Icon(Icons.person_rounded),
            ),
            Text('Profile', textScaleFactor: 1.2),
          ],
        ),
      ),
    );
  }

  Widget contactUsButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: () {print('Contact Us');},
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 10),
              child: Icon(Icons.contact_mail_rounded),
            ),
            Text('Contact Us', textScaleFactor: 1.2),
          ],
        ),
      ),
    );
  }

  Widget settingsButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: () {print('Settings');},
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 10),
              child: Icon(Icons.settings_rounded),
            ),
            Text('Settings', textScaleFactor: 1.2),
          ],
        ),
      ),
    );
  }

  Widget profilePictureModule() {
    return Stack(
      children: [
        // background Image Module
        Container(
          height: Get.height * 0.12,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('${ImageUrl.bannerImg}'),
                fit: BoxFit.cover,
              )
          ),
        ),

        // Close Button Module
        Positioned(
          top: 5,
          right: 5,
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: Icon(
                  Icons.close_rounded,
                  size: 18,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget loginButton() {
    return Container(
      child: ListTile(
        onTap: () {
          Get.back();
          Get.to(() => SignInScreen());
        },
        leading: Icon(Icons.login_outlined),
        title: Text('Login', textScaleFactor: 1.2),
      ),
    );
  }
}
