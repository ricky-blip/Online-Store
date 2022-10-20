import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ricky_store/app/data/models/products/product_recommended_model.dart';
import 'package:ricky_store/app/shared/constant/color.dart';

import '../../../shared/config/config.dart';
import 'recommended_product_ratings_widget.dart';

class RecommendedProductsWidget extends StatelessWidget {
  ProductRecommended recommendedW;

  RecommendedProductsWidget({required this.recommendedW});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 20,
      ),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.42,
            child: Card(
              elevation: 3,
              color: appWhite,
              shadowColor: appBlue,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: InkWell(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Image.network(
                        recommendedW.gambar,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: 8),
                      Text(
                        recommendedW.merk.merkProduct +
                            " " +
                            recommendedW.namaProduct,
                        style: Get.textTheme.subtitle1,
                      ),
                      SizedBox(height: 7),
                      Text(
                        Config.convertToIdr(recommendedW.harga, 0),
                        style: Get.textTheme.subtitle2,
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          RatingsWidget(starRatings: recommendedW),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
