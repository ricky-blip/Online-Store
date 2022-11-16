import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ricky_store/app/shared/constant/color.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appScaffoldBlue,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appScaffoldBlue,
        title: Text(
          'Cart',
          style: Get.textTheme.headline5,
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Cart',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
