import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as myhttp;
import 'package:ricky_store/app/config/config.dart';
import 'package:ricky_store/app/data/models/product_new_model.dart';

class LandingPageController extends GetxController {
  //SECTION Product New
  //NOTE Variable for Product New
  List<ProductNew> productNewList = <ProductNew>[];

  Future<List<ProductNew>> getProductNew(String tipe) async {
    String endPoint = "";
    if (tipe == "new") {
      endPoint = "product-new";
    } else if (tipe == "recommended") {
      endPoint = "product-rekomendasi";
    }

    List<ProductNew> listProductNew = [];

    try {
      //NOTE Get API
      var response = await myhttp.get(
        Uri.parse(Config.urlApi + endPoint),
      );

      //NOTE Logic
      if (response.statusCode == 200) {
        //Get json Body and convert to json
        var responseBody = jsonDecode(response.body);

        //Save data
        List listProductNewResponse = responseBody["data"];

        //Get all Data from ResponseBody with Looping and Throw data to variable productNewList
        for (var element in listProductNewResponse) {
          listProductNew.add(
            ProductNew.fromJson(element),
          );
        }
      } else {
        productNewList = [];
      }
    } catch (e) {
      print(e);
    }

    return listProductNew;
  }
}
