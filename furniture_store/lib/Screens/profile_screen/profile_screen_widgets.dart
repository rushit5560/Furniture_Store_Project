import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:furniture_store/Screens/cart_screen/cart_screen.dart';
import 'package:furniture_store/Screens/notification_screen/notification_screen.dart';
import 'package:furniture_store/Screens/order_screen/order_screen.dart';
import 'package:furniture_store/Screens/settings_screen/settings_screen.dart';
import 'package:furniture_store/common/common_widgets.dart';
import 'package:furniture_store/common/custom_color.dart';
import 'package:furniture_store/common/field_validation.dart';
import 'package:furniture_store/common/image_url.dart';
import 'package:furniture_store/common/text_fields_decorations.dart';
import 'package:furniture_store/controllers/profile_screen_controller/profile_screen_controller.dart';
import 'package:furniture_store/models/profile_screen_model/city_model.dart';
import 'package:furniture_store/models/profile_screen_model/country_model.dart';
import 'package:furniture_store/models/profile_screen_model/state_model.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

PreferredSizeWidget profileScreenAppBarModule(context) {
  return AppBar(
    title: Text('Profile'),
    elevation: 0,
    centerTitle: true,
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 8),
        child: GestureDetector(
          onTap: () => editProfileDialogModule(context),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: Icon(Icons.edit, color: CustomColor.kLightGreenColor),
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

class UserDetails extends StatelessWidget {
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
                ProfileImageModule(),
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

                ButtonModule(title: 'Notification', index: 0),
                ButtonModule(title: 'My Order', index: 1),
                ButtonModule(title: 'Cart', index: 2),
                ButtonModule(title: 'Settings', index: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileImageModule extends StatefulWidget {
  const ProfileImageModule({Key? key}) : super(key: key);

  @override
  _ProfileImageModuleState createState() => _ProfileImageModuleState();
}

class _ProfileImageModuleState extends State<ProfileImageModule> {
  final imagePicker = ImagePicker();
  File? file;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Icon(Icons.camera_alt_rounded, size: 18),
                ),
              ),
            ),
          ),
        ),
      ],
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
        });
  }

  void gallery() async {
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        file = File(image.path);
      });
    } else {}
  }

  void camera() async {
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        file = File(image.path);
      });
    } else {}
  }
}

class ButtonModule extends StatelessWidget {
  final title;
  final index;

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

void navigateTo(index) {
  index == 0
      ? Get.to(() => NotificationScreen())
      : index == 1
          ? Get.to(() => OrderScreen())
          : index == 2
              ? Get.to(() => CartScreen())
              : Get.to(() => SettingsScreen());
}

// Edit Profile modules
editProfileDialogModule(BuildContext context) {
  final profileScreenController = Get.find<ProfileScreenController>();

  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState2) {
            return Obx(
              () => profileScreenController.isLoading.value
                  ? CustomCircularProgressIndicator()
                  : AlertDialog(
                      content: Form(
                        key: profileScreenController.formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            EditProfileTextModule(),
                            SizedBox(height: 5),
                            FullNameTextField(),
                            SizedBox(height: 8),
                            CountryDropDownModule(),
                            SizedBox(height: 8),
                            StateDropDownModule(),
                            SizedBox(height: 8),
                            CityDropDownModule(),
                            SizedBox(height: 8),
                            UpdateButton(),
                          ],
                        ),
                      ),
                    ),
            );
          },
        );
      });
}

class EditProfileTextModule extends StatelessWidget {
  const EditProfileTextModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Edit Profile',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        Divider(color: CustomColor.kLightGreenColor, thickness: 1),
      ],
    );
  }
}

// class FullNameTextField extends StatelessWidget {
//   final fullNameController;
//   final hintText;
//   FullNameTextField({required this.fullNameController, required this.hintText});
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       cursorColor: CustomColor.kLightGreenColor,
//       controller: fullNameController,
//       validator: (value){
//         if(value!.isEmpty){
//           return 'Field Can\'t Empty';
//         }
//       },
//       decoration: InputDecoration(
//         isDense: true,
//         contentPadding: EdgeInsets.symmetric(vertical: 5),
//         hintText: '$hintText',
//         enabledBorder: UnderlineInputBorder(),
//         focusedBorder: UnderlineInputBorder(),
//         errorBorder: UnderlineInputBorder(),
//         focusedErrorBorder: UnderlineInputBorder(),
//       ),
//     );
//   }
// }

// class EmailIdTextField extends StatelessWidget {
//   final emailIdController;
//   final hintText;
//   EmailIdTextField({required this.emailIdController, required this.hintText});
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       cursorColor: CustomColor.kLightGreenColor,
//       controller: emailIdController,
//       validator: (value){
//         if(value!.isEmpty){
//           return 'Field Can\'t Empty';
//         }
//         else if(!value.contains('@')){
//           return 'Enter Valid Email Id';
//         }
//       },
//       decoration: InputDecoration(
//         isDense: true,
//         contentPadding: EdgeInsets.symmetric(vertical: 5),
//         hintText: '$hintText',
//         enabledBorder: UnderlineInputBorder(),
//         focusedBorder: UnderlineInputBorder(),
//         errorBorder: UnderlineInputBorder(),
//         focusedErrorBorder: UnderlineInputBorder(),
//       ),
//     );
//   }
// }

// class AddressTextField extends StatelessWidget {
//   final addressController;
//   final hintText;
//   AddressTextField({required this.addressController, required this.hintText});
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       cursorColor: CustomColor.kLightGreenColor,
//       controller: addressController,
//       validator: (value){
//         if(value!.isEmpty){
//           return 'Field Can\'t Empty';
//         }
//       },
//       decoration: InputDecoration(
//         isDense: true,
//         contentPadding: EdgeInsets.symmetric(vertical: 5),
//         hintText: '$hintText',
//         enabledBorder: UnderlineInputBorder(),
//         focusedBorder: UnderlineInputBorder(),
//         errorBorder: UnderlineInputBorder(),
//         focusedErrorBorder: UnderlineInputBorder(),
//       ),
//     );
//   }
// }

// enum Gender {male, female}

// class GenderRadioButton extends StatefulWidget {
//   var setState2;
//   Gender gender;
//   GenderRadioButton({
//     required this.setState2,
//     required this.gender,
// });
//
//   @override
//   _GenderRadioButtonState createState() => _GenderRadioButtonState();
// }
// class _GenderRadioButtonState extends State<GenderRadioButton> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Container(
//           child: Row(
//             children: [
//               Radio(
//                 value: Gender.male,
//                 groupValue: widget.gender,
//                 onChanged: (Gender? val){
//                   widget.setState2(() {
//                     widget.gender = val!;
//                     print(widget.gender);
//                   });
//                 },
//               ),
//               SizedBox(width: 5),
//               Text(
//                 'Male',
//                 style: TextStyle(
//                     color: Colors.black
//                 ),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(width: 10),
//         Container(
//           child: Row(
//             children: [
//               Radio(
//                 value: Gender.female,
//                 groupValue: widget.gender,
//                 onChanged: (Gender? val){
//                   widget.setState2(() {
//                     widget.gender = val!;
//                     print(widget.gender);
//
//                   });
//                 },
//               ),
//               SizedBox(width: 5),
//               Text(
//                 'Female',
//                 style: TextStyle(
//                     color: Colors.black
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

class FullNameTextField extends StatelessWidget {
  final profileScreenController = Get.find<ProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: profileScreenController.fullNameController,
      validator: (value) => FieldValidator().validateFullName(value!),
      decoration: addReviewFieldDecoration(hintText: 'UserName'),
    );
  }
}

class CountryDropDownModule extends StatelessWidget {
  final profileScreenController = Get.find<ProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        width: Get.width,
        height: 43,
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(35),
          border: Border.all(color: Colors.grey),
        ),
        child: DropdownButton<Datum>(
          value: profileScreenController.countryDropDownValue,
          icon: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey),
          style: TextStyle(color: Colors.grey),
          isExpanded: true,
          underline: Container(
            height: 1,
            color: Colors.white,
          ),
          onChanged: (newValue) {
            profileScreenController.countryDropDownValue!.name = newValue!.name;
            profileScreenController.countryDropDownValue!.id = newValue.id;
            print(
                "countryDropDownValue : ${profileScreenController.countryDropDownValue!.name}");
            print("countryDropDownValue ID : ${newValue.id}");
            profileScreenController.getStateData(newValue.id);
          },
          items: profileScreenController.countryLists
              .map<DropdownMenuItem<Datum>>((Datum value) {
            return DropdownMenuItem<Datum>(
              value: value,
              child: Text(value.name),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class StateDropDownModule extends StatelessWidget {
  final profileScreenController = Get.find<ProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        width: Get.width,
        height: 43,
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(35),
          border: Border.all(color: Colors.grey),
        ),
        child: DropdownButton<DatumState>(
          value: profileScreenController.stateDropDownValue,
          icon:
              const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey),
          style: const TextStyle(color: Colors.grey),
          isExpanded: true,
          underline: Container(
            height: 1,
            color: Colors.white,
          ),
          onChanged: (newValue) {
            profileScreenController.stateDropDownValue!.name = newValue!.name;
            profileScreenController.stateDropDownValue!.id = newValue.id;
            print(
                "stateDropDownValue : ${profileScreenController.stateDropDownValue}");
            print('newValue.name : ${newValue.name}');
            profileScreenController.getCityData(newValue.id);
            profileScreenController.loading();
          },
          items: profileScreenController.stateLists
              .map<DropdownMenuItem<DatumState>>((DatumState value) {
            return DropdownMenuItem<DatumState>(
              value: value,
              child: Text(value.name),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class CityDropDownModule extends StatelessWidget {
  final profileScreenController = Get.find<ProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        width: Get.width,
        height: 43,
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(35),
          border: Border.all(color: Colors.grey),
        ),
        child: DropdownButton<DatumCity>(
          value: profileScreenController.cityDropDownValue,
          icon: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey),
          style: TextStyle(color: Colors.grey),
          isExpanded: true,
          underline: Container(
            height: 1,
            color: Colors.white,
          ),
          onChanged: (newValue) {
            profileScreenController.cityDropDownValue!.name = newValue!.name;
            profileScreenController.cityDropDownValue!.id = newValue.id;
            print(
                "cityDropDownValue : ${profileScreenController.cityDropDownValue}");
            print('newValue.name : ${newValue.name}');
            profileScreenController.loading();
          },
          items: profileScreenController.cityLists
              .map<DropdownMenuItem<DatumCity>>((DatumCity value) {
            return DropdownMenuItem<DatumCity>(
              value: value,
              child: Text(value.name),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class UpdateButton extends StatelessWidget {
  final profileScreenController = Get.find<ProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (profileScreenController.formKey.currentState!.validate()) {
          if (profileScreenController.countryDropDownValue!.id == 0) {
            Fluttertoast.showToast(
                msg: 'Please Select Country', toastLength: Toast.LENGTH_LONG);
          } else if (profileScreenController.stateDropDownValue!.id == 0) {
            Fluttertoast.showToast(
                msg: 'Please Select State', toastLength: Toast.LENGTH_LONG);
          } else if (profileScreenController.cityDropDownValue!.id == 0) {
            Fluttertoast.showToast(
                msg: 'Please Select City', toastLength: Toast.LENGTH_LONG);
          } else {
            profileScreenController.updateProfileData(
              "${profileScreenController.fullNameController.text.trim()}",
            );
          }
        }
      },
      child: Container(
        alignment: Alignment.center,
        color: CustomColor.kLightGreenColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Update',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
