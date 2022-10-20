import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/products_list_controller.dart';

class ProductsListView extends GetView<ProductsListController> {
  const ProductsListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProductsListView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ProductsListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
