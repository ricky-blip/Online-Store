import 'dart:convert';

import 'package:get/get.dart';
import 'package:ricky_store/app/data/models/cart/cart_list_model.dart';
import 'package:ricky_store/app/shared/config/config.dart';
import 'package:http/http.dart' as myhttp;
import 'package:sp_util/sp_util.dart';

class CartController extends GetxController {
  //SECTION Function List Cart
  Future<List<CartModel>> getCartList() async {
    //Field EndPoint
    String endPointCartList =
        "${Config.urlApi}keranjang-list?user_id=${SpUtil.getInt("id_user")}";

    //Field for result cart list
    List<CartModel> cartList = [];

    //NOTE get API with http request(GET)
    try {
      //Field response get API
      var myResponse = await myhttp.get(
        Uri.parse(endPointCartList),
      );
      //checking response
      if (myResponse.statusCode == 200) {
        //create field for get json body and convert to json
        var myResponseBody = jsonDecode(myResponse.body);
        //get inside value "data"
        List listDataCart = myResponseBody["data"];
        //collect value with looping listDataCart
        for (var element in listDataCart) {
          cartList.add(
            CartModel.fromJson(element),
          );
        }
      } else {
        //just return empty list
        cartList = [];
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }

    return cartList;
  }
}
