import 'dart:convert';

import 'package:get/get.dart';
import 'package:ricky_store/app/data/models/order(purchase)/order_model.dart';
import 'package:ricky_store/app/shared/config/config.dart';
import 'package:sp_util/sp_util.dart';
import 'package:http/http.dart' as myhttp;

class PurchaseController extends GetxController {
  //SECTION Order New
  Future<List<OrderModel>> getOrderNew() async {
    //Field EndPoint
    String endPointOrderNew =
        "${Config.urlApi}checkout-list-baru?user_id=${SpUtil.getInt("id_user")}";

    //Field for result cart list
    List<OrderModel> orderNew = [];

    //NOTE get API with http request(GET)
    try {
      //Field response get API
      var myResponse = await myhttp.get(
        Uri.parse(endPointOrderNew),
      );
      //checking response
      if (myResponse.statusCode == 200) {
        //create field for get json body and convert to json
        var myResponseBody = jsonDecode(myResponse.body);
        //get inside value "data"
        List listDataCart = myResponseBody["data"];
        //collect value with looping listDataCart
        for (var element in listDataCart) {
          orderNew.add(
            OrderModel.fromJson(element),
          );
        }
      } else {
        //just return empty list
        orderNew = [];
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }

    return orderNew;
  }
}
