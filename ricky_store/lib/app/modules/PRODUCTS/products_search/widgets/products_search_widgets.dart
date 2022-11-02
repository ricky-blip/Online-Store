import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ricky_store/app/data/models/products/product_list_model.dart';
import 'package:ricky_store/app/data/models/products/product_recommended_model.dart';
import 'package:ricky_store/app/data/models/products/product_search_model.dart';
import 'package:ricky_store/app/modules/PRODUCTS/products_search/widgets/products_search_rating_widget.dart';
import 'package:ricky_store/app/modules/STARTED/landing_page/widgets/recommended_product_ratings_widget.dart';
import 'package:ricky_store/app/modules/PRODUCTS/products_list/widgets/products_list_rating_widget.dart';
import 'package:ricky_store/app/shared/constant/color.dart';

import '../../../../shared/config/config.dart';

class ProductSearchWidget extends StatelessWidget {
  ProductSearch allSearchList;

  ProductSearchWidget({super.key, required this.allSearchList});

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
            width: MediaQuery.of(context).size.width * 0.40,
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
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(
                        allSearchList.gambar,
                        width: MediaQuery.of(context).size.width * 1,
                        //tambahin height
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        allSearchList.merk.merkProduct,
                        style: Get.textTheme.subtitle1,
                      ),
                      Text(
                        allSearchList.namaProduct,
                        style: Get.textTheme.subtitle1,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 7),
                      Text(
                        Config.convertToIdr(allSearchList.harga, 0),
                        style: Get.textTheme.subtitle2,
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          RatingsWidgetProductSearch(
                              starRatings: allSearchList),
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
