import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ricky_store/app/routes/app_pages.dart';
import 'package:ricky_store/app/shared/config/config.dart';
import 'package:ricky_store/app/shared/constant/color.dart';
import 'package:sp_util/sp_util.dart';
import 'package:http/http.dart' as myhttp;

class OrderController extends GetxController {
  //SECTION LIST DROPDOWN
  //list Payment
  final List<String> paymentMethod = [
    'TRANSFER BANK',
    'CASH ON DELIVERY',
  ];
  RxString selectedPayment = 'TRANSFER BANK'.obs;
  //list Delivery
  final List<String> delivery = [
    'SICEPAT',
    'JNE',
    'JNT',
  ];
  RxString selectedDelivery = 'SICEPAT'.obs;
  //list City
  final List<String> city = [
    'PALEMBANG',
    'LAMPUNG',
    'JAKARTA',
    'YOGYAKARTA',
    'SURABAYA',
  ];
  RxString selectedCity = 'PALEMBANG'.obs;

  //SECTION Input Order Now with endPoint 'keranjang-post'
  Future postOrderNow(int productId, int jumlahOrder) async {
    //Field EndPoint
    var myEndPointUrl = Uri.parse('${Config.urlApi}keranjang-post');

    try {
      //Checking user isLogin?
      if (SpUtil.getString("name_user").toString() == "") {
        Get.snackbar(
          "Warning",
          "You need Login",
          margin: const EdgeInsets.all(10),
          snackPosition: SnackPosition.TOP,
          backgroundColor: appRed,
          colorText: appWhite,
        );
        //user go to Login
        Get.toNamed(Routes.LOGIN);
      } else {
        //Checking user already Login!
        final myResponse = await myhttp.post(
          myEndPointUrl,
          body: {
            'product_id': productId.toString(),
            'jumlah': jumlahOrder.toString(),
            'user_id': SpUtil.getInt("id_user").toString(),
          },
        );
        //field convert from myResponse and get data Body
        var myResponseBody = json.decode(myResponse.body);
        //Checking Connection
        if (myResponse.statusCode == 200) {
          Get.snackbar(
            "Success",
            myResponseBody["message"],
            margin: const EdgeInsets.all(10),
            snackPosition: SnackPosition.TOP,
            backgroundColor: appGreen,
            colorText: appWhite,
          );
          //Go to Next Page
          Get.toNamed(Routes.ORDER);
        } else {
          Get.snackbar(
            "Error",
            myResponseBody["message"],
            margin: const EdgeInsets.all(10),
            snackPosition: SnackPosition.TOP,
            backgroundColor: appRed,
            colorText: appWhite,
          );
        }
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        margin: const EdgeInsets.all(10),
        snackPosition: SnackPosition.TOP,
        backgroundColor: appRed,
        colorText: appWhite,
      );
    }
  }

  //Field accommodate get data
  int jmlBarang = 0, grandTotal = 0;
  String namaProduct = "", merkProduct = "", gambarProduct = "";
  //SECTION GET data Input from Order Now with endPoint 'keranjang-list'
  Future<void> getDataInputOrderNow() async {
    //field URL endPoint
    var myURL = Uri.parse(
      "${Config.urlApi}keranjang-list?user_id${SpUtil.getInt("id_user")}",
    );

    //field get API endPoint
    final myResponse = await myhttp.get(myURL);

    //field convert to JSON
    var myResponseDecode = json.decode(myResponse.body);

    //declare data from API
    jmlBarang = myResponseDecode["jumlahBarang"];
    grandTotal = myResponseDecode["grandtotal"];
    namaProduct = myResponseDecode["data"][0]["nama_product"];
    merkProduct = myResponseDecode["data"][0]["merk_product"];
    gambarProduct =
        // ignore: prefer_interpolation_to_compose_strings
        "${Config.urlMain}storage/" + myResponseDecode["data"][0]["gambar"];

    update();
  }
}
