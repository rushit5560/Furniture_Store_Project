import 'package:flutter/material.dart';
import 'package:furniture_store/common/custom_color.dart';
import 'package:furniture_store/views/sign_up_view/sign_up_view.dart';
import 'package:get/get.dart';

class SignInWelcomeText extends StatelessWidget {
  const SignInWelcomeText({Key? key}) : super(key: key);

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

class SignInEmailFieldModule extends StatelessWidget {
  TextEditingController emailFieldController;

  SignInEmailFieldModule({required this.emailFieldController});

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

class SignInPasswordFieldModule extends StatelessWidget {
  TextEditingController passwordFieldController;

  SignInPasswordFieldModule({required this.passwordFieldController});

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

class LoginButton extends StatelessWidget {
  TextEditingController emailFieldController, passwordFieldController;
  GlobalKey<FormState> formKey;

  LoginButton({
    required this.formKey,
    required this.emailFieldController,
    required this.passwordFieldController,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (formKey.currentState!.validate()) {
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
              'Login',
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

class SignInWithText extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Text(
      'Sign In With',
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
          onTap: () {print('Facebook Login');},
          child: Container(
            height: Get.height * 0.05,
            width: Get.height * 0.05,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey
            ),
          ),
        ),

        const SizedBox(width: 15),

        GestureDetector(
          onTap: () {print('Google Login');},
          child: Container(
            height: Get.height * 0.05,
            width: Get.height * 0.05,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey
            ),
          ),
        ),
      ],
    );
  }
}

class SignUpText extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
            'No Account? ',
          style: TextStyle(fontSize: 15),
        ),
        GestureDetector(
          onTap: () {
            Get.off(()=> SignUpView());
          },
          child: Text(
            'Signup',
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
