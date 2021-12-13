import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:furniture_store/Screens/index_screen/index_screen.dart';
import 'package:furniture_store/common/api_url.dart';
import 'package:furniture_store/common/common_functions.dart';
import 'package:furniture_store/models/signup_screen_model/signup_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignUpScreenController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController userNameFieldController = TextEditingController();
  TextEditingController emailFieldController = TextEditingController();
  TextEditingController passwordFieldController = TextEditingController();

  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;

  getRegisterData(String userName, String emailId, String password) async {
    isLoading(true);
    String url = ApiUrl.RegisterApi;
    print('Url : $url');

    try{
      Map data = {
        "name": "$userName",
        "email": "$emailId",
        "password": "$password",
        "c_password": "$password",
      };

      http.Response response = await http.post(Uri.parse(url), body: data);

      // When User SignUp Failed
      if (response.body.contains('The email has already been taken')) {
        print('Email Already Registered');
        Get.snackbar('Error!', 'Email Already Registered');
      }

      SignUpData signUpData = SignUpData.fromJson(json.decode(response.body));
      isStatus = signUpData.success.obs;

      if(isStatus.value){
        var id = signUpData.data[0].id;
        var token = signUpData.data[0].rememberToken;
        // Save id And token in SharedPreference
        CommonFunctions().setUserDetailsInPrefs(id, token);
        Get.offAll(() => IndexScreen());
        Get.snackbar('User Registered Successfully.', '');
      } else {
        print('Register False');
      }

    } catch(e) {
      print('Register Error : $e');
    } finally {
      isLoading(false);
    }
  }
}