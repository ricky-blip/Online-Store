import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ricky_store/app/data/models/cart/cart_list_model.dart';
import 'package:ricky_store/app/modules/CART/cart/widgets/cart_list_widget.dart';
import 'package:ricky_store/app/shared/constant/color.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  CartView({Key? key}) : super(key: key);
  final cartC = Get.lazyPut(() => CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appScaffoldBlue,
      appBar: AppBar(
        title: Text("CART"),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              FutureBuilder<List<CartModel>>(
                future: controller.getCartList(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Waiting . . .");
                  } else if (snapshot.hasData) {
                    return Row(
                      children: [
                        ...snapshot.data!.map(
                          (e) => CartListWidget(listCart: e),
                        ),
                      ],
                    );
                  }
                  return Text("Data Cart");
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
