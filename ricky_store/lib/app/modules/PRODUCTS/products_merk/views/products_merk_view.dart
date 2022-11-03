import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/products_merk_controller.dart';

class ProductsMerkView extends GetView<ProductsMerkController> {
  const ProductsMerkView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProductsMerkView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ProductsMerkView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
