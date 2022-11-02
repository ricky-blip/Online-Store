import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/products_search_controller.dart';

class ProductsSearchView extends GetView<ProductsSearchController> {
  const ProductsSearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProductsSearchView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ProductsSearchView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
