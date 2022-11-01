import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as myhttp;
import 'package:ricky_store/app/data/models/products/product_detail_model.dart';

import '../../../../shared/config/config.dart';

class ProductsDetailController extends GetxController {
  //SECTION Product List
  Future<List<ProductDetail>> getProductDetail() async {
    String endPointProductDetail = "product-detail";

    List<ProductDetail> allProductDetail = [];

    try {
      var response = await myhttp.get(
        Uri.parse(Config.urlApi + endPointProductDetail),
      );
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        List allProductDetailResponse = responseBody["data"];
        for (var element in allProductDetailResponse) {
          allProductDetail.add(
            ProductDetail.fromJson(element),
          );
        }
      } else {
        allProductDetail = [];
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }

    return allProductDetail;
  }
}
