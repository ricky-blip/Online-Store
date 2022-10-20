import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ricky_store/app/shared/config/config.dart';
import 'package:ricky_store/app/shared/constant/color.dart';
import 'package:ricky_store/app/data/models/product_new_model.dart';

class NewProductsWidget extends StatelessWidget {
  final ProductNew newProduct;

  const NewProductsWidget({super.key, required this.newProduct});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Card(
          elevation: 3,
          shadowColor: appBlue,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: InkWell(
            onTap: () {},
            child: Column(
              children: [
                Ink.image(
                  image: NetworkImage(newProduct.gambar),
                  height: 250,
                  width: 250,
                  fit: BoxFit.contain,
                ),
                Text(newProduct.namaProduct),
                Text(newProduct.harga.toString()),
                Text("Rating"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
