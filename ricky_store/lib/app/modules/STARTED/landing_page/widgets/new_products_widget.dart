import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ricky_store/app/modules/PRODUCTS/products_detail/views/products_detail_new_view.dart';
import 'package:ricky_store/app/shared/config/config.dart';
import 'package:ricky_store/app/shared/constant/color.dart';
import 'package:ricky_store/app/data/models/product/product_new_model.dart';

import 'new_product_ratings_widget.dart';

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
            onTap: () {
              Get.to(ProductsDetailNewView(productNewDetails: newProduct));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Ink.image(
                  image: NetworkImage(newProduct.gambar),
                  height: 250,
                  width: 300,
                  fit: BoxFit.contain,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        newProduct.namaProduct,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        Config.convertToIdr(
                          newProduct.harga,
                          0,
                        ),
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 7),
                      Row(
                        children: [
                          RatingsWidgetNew(starRatings: newProduct),
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
