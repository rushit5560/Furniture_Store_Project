import 'package:flutter/material.dart';
import 'package:furniture_store/common/custom_color.dart';
import 'package:furniture_store/views/sign_in_view/sign_in_view.dart';
import 'package:get/get.dart';

class SignUpUserNameFieldModule extends StatelessWidget {
  TextEditingController userNameFieldController;

  SignUpUserNameFieldModule({required this.userNameFieldController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'UserName',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        TextFormField(
          controller: userNameFieldController,
          cursorColor: CustomColor.kLightGreenColor,
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value!.isEmpty) {
              return "UserName Field not be Empty";
            }
          },
          decoration: inputDecoration('Enter UserName'),
        ),
      ],
    );
  }
}

class SignUpEmailFieldModule extends StatelessWidget {
  TextEditingController emailFieldController;

  SignUpEmailFieldModule({required this.emailFieldController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Email',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        TextFormField(
          controller: emailFieldController,
          cursorColor: CustomColor.kLightGreenColor,
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value!.isEmpty) {
              return "Email Field not be Empty";
            }
            if (!value.contains('@')) {
              return "Enter Valid Email";
            }
          },
          decoration: inputDecoration('Enter Email'),
        ),
      ],
    );
  }
}

class SignUpPasswordFieldModule extends StatelessWidget {
  TextEditingController passwordFieldController;

  SignUpPasswordFieldModule({required this.passwordFieldController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Password',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        TextFormField(
          controller: passwordFieldController,
          cursorColor: CustomColor.kLightGreenColor,
          keyboardType: TextInputType.emailAddress,
          obscureText: true,
          validator: (value) {
            if (value!.isEmpty) {
              return "Password Field not be Empty";
            }
            if (value.length <= 5) {
              return "Password Length atLeast 6 Character";
            }
          },
          decoration: inputDecoration('Enter Password'),
        ),
      ],
    );
  }
}

class SignUpButton extends StatelessWidget {
  TextEditingController emailFieldController, passwordFieldController, userNameFieldController;
  GlobalKey<FormState> formKey;

  SignUpButton({
    required this.formKey,
    required this.userNameFieldController,
    required this.emailFieldController,
    required this.passwordFieldController,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (formKey.currentState!.validate()) {
          print('Username : ${userNameFieldController.text}');
          print('Email : ${emailFieldController.text}');
          print('password : ${passwordFieldController.text}');
        }
      },
      child: Container(
        color: CustomColor.kLightGreenColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Center(
            child: Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SignUpWithText extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Text(
      'Sign Up With',
      style: TextStyle(
        fontWeight: FontWeight.bold,

      ),
    );
  }
}

class SignInText extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Have A Already Account? ',
          style: TextStyle(fontSize: 15),
        ),
        GestureDetector(
          onTap: () {
            Get.off(()=> SignInView());
          },
          child: Text(
            'Signin',
            style: TextStyle(color: CustomColor.kLightGreenColor, fontSize: 15),
          ),
        ),
      ],
    );
  }
}

InputDecoration inputDecoration(hintText) {
  return InputDecoration(
    hintText: '$hintText',
    isDense: true,
    contentPadding: EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 2),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    ),
    errorBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    ),
    focusedErrorBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    ),
  );
}