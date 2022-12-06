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
  final List<String> payment = [
    'TF',
    'GOPAY',
  ];
  RxString selectedPayment = 'TF'.obs;

  //list Delivery
  final List<String> delivery = [
    'SICEPAT',
    'JNE',
    'J&T',
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
  Future postOrderNow(
    int productId,
    int jumlahOrder,
  ) async {
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
          Get.offAllNamed(Routes.HOME);
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
  int jmlBarang = 0, grandTotal = 0, jmlhOrderBarang = 0, totalHargaBarang = 0;
  String namaProduct = "", merkProduct = "", gambarProduct = "";

  //SECTION GET data Input from Order Now with endPoint 'keranjang-list'
  Future<void> getDataInputOrderNow() async {
    //field URL endPoint
    var myURL = Uri.parse(
      "${Config.urlApi}keranjang-list?user_id=${SpUtil.getInt("id_user").toString()}",
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
    jmlhOrderBarang = myResponseDecode["data"][0]["jumlah"];
    totalHargaBarang = myResponseDecode["data"][0]["totalharga"];
    gambarProduct =
        "${Config.urlMain}storage/${myResponseDecode["data"][0]["gambar"]}";

    update();
  }

  // textediting controller form Input
  TextEditingController notes = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();

  //SECTION after input Order Now post data to /checkout-post(endpoint)

  Future postCheckout(
    String city,
    String pay,
    String deliver,
  ) async {
    //endPoint
    var myURL = Uri.parse("${Config.urlApi}checkout-post");

    try {
      //Checking isLogin?
      if (SpUtil.getString("name_user").toString() == "") {
        Get.snackbar(
          "Warning",
          "You need Login",
          margin: const EdgeInsets.all(10),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.orange,
          colorText: appWhite,
        );
        // Direct to Sign In
        Get.toNamed(Routes.LOGIN);
      } else {
        //after Login/already Login, need http POST
        final myResponse = await myhttp.post(
          myURL,
          body: {
            'nama': name.text,
            'user_id': SpUtil.getInt("id_user").toString(),
            'nohp': phone.text,
            'alamat': address.text,
            'kota_kecamatan': city,
            'catatan': notes.text,
            'jenis_pembayaran': pay,
            'jenis_pengiriman': deliver,
          },
        );
        //convert from data http to JSON (DECODE)
        var myResponseDecode = json.decode(myResponse.body);
        //notification if connection OK/Error
        if (myResponse.statusCode == 200) {
          Get.snackbar(
            "Success",
            myResponseDecode["message"],
            margin: const EdgeInsets.all(10),
            snackPosition: SnackPosition.TOP,
            backgroundColor: appGreen,
            colorText: appWhite,
          );
          //if success goto HOME
          Get.offAllNamed(Routes.HOME);
        } else {
          Get.snackbar(
            "Error",
            myResponseDecode["message"],
            margin: const EdgeInsets.all(10),
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.red,
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
}
