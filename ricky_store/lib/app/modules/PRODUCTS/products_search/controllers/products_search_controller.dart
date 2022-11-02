import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ricky_store/app/data/models/products/product_search_model.dart';
import 'package:http/http.dart' as myhttp;
import 'package:ricky_store/app/shared/config/config.dart';

class ProductsSearchController extends GetxController {
  //Field
  TextEditingController keywordInput = TextEditingController();

  //Function
  Future<List<ProductSearch>> searchProduct(String keyword) async {
    //Field
    List<ProductSearch> listProductSearch = [];

    try {
      //Get EndPoint
      var myResponse = await myhttp.get(
        Uri.parse("${Config.urlApi}product-search?keyword=$keyword"),
      );
      //condition
      if (myResponse.statusCode == 200) {
        var myResponseBody = json.decode(myResponse.body);
        //Field
        List listProductSearchResponse = myResponseBody['data'];
        //Looping
        for (var element in listProductSearchResponse) {
          listProductSearch.add(
            ProductSearch.fromJson(element),
          );
        }
      } else {
        listProductSearch = [];
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }

    return listProductSearch;
  }
}
