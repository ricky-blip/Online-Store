import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ricky_store/app/data/models/products/product_detail_model.dart';
import 'package:ricky_store/app/shared/constant/color.dart';

class ProductDetailWidget extends StatelessWidget {
  final ProductDetail productDetails;

  const ProductDetailWidget({super.key, required this.productDetails});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
