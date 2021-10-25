import 'dart:io';
import 'package:flutter/material.dart';
import 'package:furniture_store/Screens/cart_screen/cart_screen.dart';
import 'package:furniture_store/Screens/notification_screen/notification_screen.dart';
import 'package:furniture_store/Screens/order_screen/order_screen.dart';
import 'package:furniture_store/Screens/settings_screen/settings_screen.dart';
import 'package:furniture_store/common/custom_color.dart';
import 'package:furniture_store/common/image_url.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

PreferredSizeWidget profileScreenAppBarModule() {
  return AppBar(
    title: Text('Profile'),
    elevation: 0,
    centerTitle: true,
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 8),
        child: GestureDetector(
          onTap: () => print('Edit Clk'),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: Icon(Icons.edit,color: CustomColor.kLightGreenColor),
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        ),
      )
    ],
  );
}

class GreenBackgroundModule extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: CustomColor.kLightGreenColor,
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}


class UserDetails extends StatefulWidget {
  // const UserDetails({Key? key}) : super(key: key);
  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  File? file;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        color: Colors.white,
        child: Transform(
          transform: Matrix4.translationValues(0, -45, 0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // Profile Image Module
                Stack(
                  children: [
                    Container(
                      height: Get.height * 0.12,
                      width: Get.height * 0.12,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: file != null
                              ? DecorationImage(
                                  image: FileImage(file!),
                                  fit: BoxFit.cover,
                                )
                              : DecorationImage(
                                  image: AssetImage('${ImageUrl.profileImg}'),
                                  fit: BoxFit.cover,
                                )),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 10,
                      child: Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(30),
                        child: GestureDetector(
                          onTap: () => showPicker(context),
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: Icon(Icons.camera_alt_rounded, size: 18),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  'Jenny Doe',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),

                Text('jenny@gmail.com'),
                const SizedBox(height: 8),

                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'UserName',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Email Id',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Jenny Doe',
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'jenny@gmail.com',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),

                Divider(thickness: 1),
                const SizedBox(height: 5),

                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Address',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Gender',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '7000, WhiteField, Manchester, Highway, London, 401203',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Female',
                      ),
                    ),
                  ],
                ),

                ButtonModule(title: 'Notification',index: 0),
                ButtonModule(title: 'My Order',index: 1),
                ButtonModule(title: 'Cart',index: 2),
                ButtonModule(title: 'Settings',index: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Gallery'),
                      onTap: () {
                        gallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      camera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  void gallery() async {
    final imagePicker = ImagePicker();
    final image = await imagePicker.getImage(source: ImageSource.gallery);

    if(image != null){
      setState(() {
      file = File(image.path);
      });
    } else{}
  }

  void camera() async {
    final imagePicker = ImagePicker();
    final image = await imagePicker.getImage(source: ImageSource.camera);

    if(image != null){
      setState(() {
      file = File(image.path);
      });
    } else{}
  }
}


class ButtonModule extends StatelessWidget {
  String title;
  int index;

  ButtonModule({required this.title, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigateTo(index),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          decoration: BoxDecoration(border: Border.all()),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('$title'),

                Icon(Icons.arrow_forward_ios_rounded, size: 18),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


void navigateTo(index){
  index == 0 ? Get.to(()=> NotificationScreen())
             : index == 1 ? Get.to(()=> OrderScreen())
             : index == 2 ? Get.to(()=> CartScreen())
             : Get.to(()=> SettingsScreen());
}

