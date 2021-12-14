import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:furniture_store/common/api_url.dart';
import 'package:furniture_store/models/contact_us_screen_model/contact_us_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ContactUsScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  GlobalKey<FormState> formKey =  GlobalKey();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController commentController = TextEditingController();

  getContactUsData(String fullName, String emailId, String phoneNo, String subject, String comment) async {
    isLoading(true);
    String url = ApiUrl.ContactUsApi;
    print('Url : $url');

    try{
      Map data = {
        "name": "$fullName",
        "email": "$emailId",
        "subject": "$subject",
        "message": "$comment",
        "phone": "$phoneNo"
      };
      print('data : $data');

      http.Response response = await http.post(Uri.parse(url), body: data);

      ContactUsData contactUsData = ContactUsData.fromJson(json.decode(response.body));
      isStatus = contactUsData.success.obs;

      if(isStatus.value){
        Fluttertoast.showToast(msg: "${contactUsData.message.toString()}");
        Get.back();
      } else {
        print('Contact Us False');
      }
    } catch(e){
      print('Contact Us Error : $e');
    } finally {
      isLoading(false);
    }
  }

}