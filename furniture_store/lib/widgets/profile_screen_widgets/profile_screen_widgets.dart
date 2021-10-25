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
    final image = await imagePicker.getImage(source: ImageSource.gallery);
    if(image != null){
      setState(() {
        file = File(image.path);
      });
    } else{}
  }

  void camera() async {
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


// Edit Profile modules
editProfileDialogModule(BuildContext context) {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  Gender gender = Gender.male;


  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState2){
            return AlertDialog(
              content: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    EditProfileTextModule(),
                    SizedBox(height: 5),

                    FullNameTextField(
                      fullNameController: fullNameController,
                      hintText: 'Full Name',
                    ),
                    SizedBox(height: 8),

                    EmailIdTextField(
                      emailIdController: emailIdController,
                      hintText: 'Email Id',
                    ),
                    SizedBox(height: 8),

                    AddressTextField(
                      addressController: addressController,
                      hintText: 'Address',
                    ),
                    SizedBox(height: 8),

                    GenderRadioButton(setState2: setState2, gender: gender),

                    SizedBox(height: 8),
                    UpdateButton(
                      formKey: formKey,
                      fullNameController: fullNameController,
                      emailIdController: emailIdController,
                      addressController: addressController,
                      // gender: gender,
                    ),
                  ],
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

class FullNameTextField extends StatelessWidget {
  TextEditingController fullNameController;
  String hintText;
  FullNameTextField({required this.fullNameController, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: CustomColor.kLightGreenColor,
      controller: fullNameController,
      validator: (value){
        if(value!.isEmpty){
          return 'Field Can\'t Empty';
        }
      },
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 5),
        hintText: '$hintText',
        enabledBorder: UnderlineInputBorder(),
        focusedBorder: UnderlineInputBorder(),
        errorBorder: UnderlineInputBorder(),
        focusedErrorBorder: UnderlineInputBorder(),
      ),
    );
  }
}

class EmailIdTextField extends StatelessWidget {
  TextEditingController emailIdController;
  String hintText;
  EmailIdTextField({required this.emailIdController, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: CustomColor.kLightGreenColor,
      controller: emailIdController,
      validator: (value){
        if(value!.isEmpty){
          return 'Field Can\'t Empty';
        }
        else if(!value.contains('@')){
          return 'Enter Valid Email Id';
        }
      },
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 5),
        hintText: '$hintText',
        enabledBorder: UnderlineInputBorder(),
        focusedBorder: UnderlineInputBorder(),
        errorBorder: UnderlineInputBorder(),
        focusedErrorBorder: UnderlineInputBorder(),
      ),
    );
  }
}

class AddressTextField extends StatelessWidget {
  TextEditingController addressController;
  String hintText;
  AddressTextField({required this.addressController, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: CustomColor.kLightGreenColor,
      controller: addressController,
      validator: (value){
        if(value!.isEmpty){
          return 'Field Can\'t Empty';
        }
      },
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 5),
        hintText: '$hintText',
        enabledBorder: UnderlineInputBorder(),
        focusedBorder: UnderlineInputBorder(),
        errorBorder: UnderlineInputBorder(),
        focusedErrorBorder: UnderlineInputBorder(),
      ),
    );
  }
}

enum Gender {male, female}

class GenderRadioButton extends StatefulWidget {
  var setState2;
  Gender gender;
  GenderRadioButton({
    required this.setState2,
    required this.gender,
});

  @override
  _GenderRadioButtonState createState() => _GenderRadioButtonState();
}
class _GenderRadioButtonState extends State<GenderRadioButton> {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          child: Row(
            children: [
              Radio(
                value: Gender.male,
                groupValue: widget.gender,
                onChanged: (Gender? val){
                  widget.setState2(() {
                    widget.gender = val!;
                    print(widget.gender);
                  });
                },
              ),
              SizedBox(width: 5),
              Text(
                'Male',
                style: TextStyle(
                    color: Colors.black
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 10),
        Container(
          child: Row(
            children: [
              Radio(
                value: Gender.female,
                groupValue: widget.gender,
                onChanged: (Gender? val){
                  widget.setState2(() {
                    widget.gender = val!;
                    print(widget.gender);

                  });
                },
              ),
              SizedBox(width: 5),
              Text(
                'Female',
                style: TextStyle(
                    color: Colors.black
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


class UpdateButton extends StatelessWidget {
  GlobalKey<FormState> formKey;
  TextEditingController fullNameController, emailIdController, addressController;
  // var gender;
  UpdateButton({
    required this.formKey,
    required this.fullNameController,
    required this.emailIdController,
    required this.addressController,
    // required this.gender,
});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(formKey.currentState!.validate()){
          print('${fullNameController.text}');
          print('${emailIdController.text}');
          print('${addressController.text}');
          // print('$gender');
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
