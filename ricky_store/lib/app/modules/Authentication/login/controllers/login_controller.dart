import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ricky_store/app/routes/app_pages.dart';
import 'package:ricky_store/app/shared/config/config.dart';
import 'package:http/http.dart' as myhttp;
import 'package:ricky_store/app/shared/constant/color.dart';
import 'package:sp_util/sp_util.dart';

class LoginController extends GetxController {
  //NOTE Field
  String endPointRegister = "${Config.urlApi}login";

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  RxBool isLoading = false.obs;
  RxBool obscure = true.obs;

  //function Obscure
  void isObscure() {
    obscure.value = !obscure.value;
  }

  //NOTE Function
  Future register() async {
    //field Endpoint from convert String_endPoint to HTTP
    var myUrl = Uri.parse(endPointRegister);

    try {
      //SECTION 1: Listing data from EndPoint
      //Loading
      isLoading.value = true;
      //POST endPoint
      final myResponse = await myhttp.post(
        myUrl,
        body: {
          'email': email.text,
          'password': password.text,
        },
      );
      //field convert from myResponse and get data Body
      var myResponseBody = json.decode(myResponse.body);

      //SECTION 2: Checking
      if (myResponse.statusCode == 200) {
        //remove email & password from previous login
        email.clear();
        password.clear();
        //Saving data input login to device memory
        SpUtil.putInt("id_user", myResponseBody["data"]["id"]);
        SpUtil.putString("name_user", myResponseBody["data"]["name"]);
        SpUtil.putString("email_user", myResponseBody["data"]["email"]);
        //notification with snackbar if success
        Get.snackbar(
          "Success",
          myResponseBody["message"],
          backgroundColor: appGreen,
          margin: const EdgeInsets.all(10),
          snackPosition: SnackPosition.TOP,
        );
        //NOTE Loading
        isLoading.value = false;
        //after all success direct to HOMEVIEW
        Get.offAllNamed(Routes.HOME);
      } else {
        //NOTE Loading
        isLoading.value = false;
        //notification with snackbar if error Client
        Get.snackbar(
          "Error",
          myResponseBody["message"],
          backgroundColor: appRed,
          margin: const EdgeInsets.all(10),
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (e) {
      isLoading.value = false;
      //notification with snackbar when Error Server
      Get.snackbar(
        "Error",
        e.toString(),
        backgroundColor: Colors.redAccent,
      );
    }
  }
}
