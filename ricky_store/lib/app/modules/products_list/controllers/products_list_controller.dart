import 'dart:convert';

import 'package:get/get.dart';
import 'package:ricky_store/app/data/models/products/product_list_model.dart';
import 'package:http/http.dart' as myhttp;
import 'package:ricky_store/app/shared/config/config.dart';

class ProductsListController extends GetxController {
  //SECTION Product List
  Future<List<ProductList>> getProductAllList() async {
    String endPointAllList = "product-list";

    List<ProductList> allProductList = [];

    try {
      var response = await myhttp.get(
        Uri.parse(Config.urlApi + endPointAllList),
      );
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        List allProductListResponse = responseBody["data"];
        for (var element in allProductListResponse) {
          allProductList.add(
            ProductList.fromJson(element),
          );
        }
      } else {
        allProductList = [];
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }

    return allProductList;
  }
}
