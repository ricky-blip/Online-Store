import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as myhttp;
import 'package:ricky_store/app/data/models/product_recommended_model.dart';

import '../../../shared/config/config.dart';
import '../../../data/models/product_new_model.dart';

class LandingPageController extends GetxController {
  //SECTION Product New
  //NOTE Variable for Product New
  List<ProductNew> productNewList = <ProductNew>[];

  Future<List<ProductNew>> getProductNew(String apiNew) async {
    //NOTE Variable EndPoint
    String endPointNew = "";
    if (apiNew == "new") {
      endPointNew = "product-new";
    }
    //Variable for Result list Product New
    List<ProductNew> listProductNew = [];

    try {
      //NOTE Get API
      var response = await myhttp.get(
        Uri.parse(Config.urlApi + endPointNew),
      );

      //NOTE Logic
      if (response.statusCode == 200) {
        //Get json Body and convert to json
        var responseBody = jsonDecode(response.body);

        //Save "data"
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

  //SECTION Product Recommended
  //NOTE Variable for Recommended New
  List<ProductRecommended> productRecommendedList = <ProductRecommended>[];

  Future<List<ProductRecommended>> getProductRecommended(
      String apiRecommended) async {
    //Variable EndPoint
    String endPointRecommended = "";
    if (apiRecommended == "recommended") {
      endPointRecommended = "product-rekomendasi";
    }

    //Variable for Result list Product Recommended
    List<ProductRecommended> listProductRecommended = [];

    try {
      //Get API
      var response = await myhttp.get(
        Uri.parse(Config.urlApi + endPointRecommended),
      );
      //Logic
      if (response.statusCode == 200) {
        //get json body and convert to json
        var responseBody = jsonDecode(response.body);

        //save "data"
        List listProductRecommendedResponse = responseBody["data"];

        //Get all Data from ResponseBody with Looping and Throw data to variable productRecommendedList
        for (var element in listProductRecommendedResponse) {
          listProductRecommended.add(
            ProductRecommended.fromJson(element),
          );
        }
      } else {
        listProductRecommended = [];
      }
    } catch (e) {
      print(e);
    }

    return listProductRecommended;
  }
}
