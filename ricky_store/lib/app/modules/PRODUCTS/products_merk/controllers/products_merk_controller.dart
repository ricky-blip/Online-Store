import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as myhttp;
import 'package:ricky_store/app/data/models/merk/merk_list_model.dart';
import 'package:ricky_store/app/data/models/merk/merk_product_model.dart';
import 'package:ricky_store/app/shared/config/config.dart';

class ProductsMerkController extends GetxController {
  //SECTION Function List Merk
  Future<List<MerkList>> getMerk() async {
    String endPoint = "merk-list";

    List<MerkList> listMerk = [];

    try {
      var myResponse = await myhttp.get(
        Uri.parse(Config.urlApi + endPoint),
      );

      if (myResponse.statusCode == 200) {
        var myResponseBody = json.decode(myResponse.body);

        //variable untuk menyimpan list data dari API
        List listProductResponse = myResponseBody['data'];

        //isikan variable listProduct yg tadinya [] dgn isi listProductResponse yg sdh diLooping
        for (var element in listProductResponse) {
          //isikan variable listProducts yg tadinya [] dgn isi listProductResponse
          listMerk.add(
            MerkList.fromJson(element),
          );
        }
      } else {
        listMerk = [];
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }

    return listMerk;
  }

  //SECTION Function Product by Merk
  Future<List<MerkProduct>> productByMerkId(String merkId) async {
    //buat variable utk menyimpan list data yg diterima dari Response
    List<MerkProduct> merkProduct = [];

    //buat request ke API sesuai dgn EndPoint yg dituju
    try {
      //mengambil respon dari API
      var myResponse = await myhttp.get(
        Uri.parse("${Config.urlApi}product-by-merk?merk_id=$merkId"),
      );

      if (myResponse.statusCode == 200) {
        var myResponseBody = json.decode(myResponse.body);

        //variable untuk menyimpan list data dari API
        List listProductResponse = myResponseBody['data'];

        //isikan variable listProduct yg tadinya [] dgn isi listProductResponse yg sdh diLooping
        for (var element in listProductResponse) {
          //isikan variable listProducts yg tadinya [] dgn isi listProductResponse
          merkProduct.add(
            MerkProduct.fromJson(element),
          );
        }
      } else {
        merkProduct = [];
      }
    } catch (e) {
      print(e);
    }
    return merkProduct;
  }
}
