import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ricky_store/app/data/models/products/product_detail_model.dart';
import 'package:ricky_store/app/shared/constant/color.dart';

import '../controllers/products_detail_controller.dart';

// ignore: must_be_immutable
class ProductsDetailView extends GetView<ProductsDetailController> {
  const ProductsDetailView({super.key, required this.productDetails});
  final ProductDetail productDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appScaffoldBlue,
      appBar: AppBar(
        title: const Text("Detail Product"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Stack(
            children: [
              //NOTE Stack 1
              Image.network(
                productDetails.gambar,
                width: MediaQuery.of(context).size.width,
                height: 350,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
      //NOTE Bottom Navigation Bar
    );
  }
}


 // child: FutureBuilder<List<ProductDetail>>(
        //   future: controller.getProductDetail(),
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return const Text("Loading Data");
        //     } else if (snapshot.hasData) {
        //       return Column(
        //         children: [
        //           ...snapshot.data!.map(
        //             (e) => SingleChildScrollView(
        //               scrollDirection: Axis.vertical,
        //               child: Column(
        //                 children: [
        //                   ProductDetailWidget(
        //                     productDetails: e,
        //                   ),
        //                   const Text("testing widget"),
        //                 ],
        //               ),
        //             ),
        //           ),
        //         ],
        //       );
        //     }
        //     return const Text("Data");
        //   },
        // ),
