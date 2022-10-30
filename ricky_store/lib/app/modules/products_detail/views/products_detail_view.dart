import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/products_detail_controller.dart';

class ProductsDetailView extends GetView<ProductsDetailController> {
  const ProductsDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProductsDetailView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ProductsDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
