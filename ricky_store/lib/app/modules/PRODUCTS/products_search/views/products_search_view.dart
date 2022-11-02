import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';
import 'package:ricky_store/app/data/models/products/product_search_model.dart';
import 'package:ricky_store/app/modules/PRODUCTS/products_search/widgets/products_search_widgets.dart';
import 'package:ricky_store/app/shared/constant/color.dart';

import '../controllers/products_search_controller.dart';

class ProductsSearchView extends GetView<ProductsSearchController> {
  const ProductsSearchView({super.key, required this.keywordInput});

  final String keywordInput;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appScaffoldBlue,
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                //SECTION Search Bar
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 20,
                    bottom: 35,
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          size: 30,
                        ),
                      ),
                      SizedBox(width: 25),
                      Text(
                        "Hasil Pencarian",
                        style: Get.textTheme.headline5,
                      ),
                    ],
                  ),
                ),

                //SECTION Product List
                FutureBuilder<List<ProductSearch>>(
                  future: controller.searchProduct(keywordInput),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Text("Waiting Data . . .");
                    } else if (snapshot.hasData) {
                      return AlignedGridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          // int sequence = index + 1;
                          ProductSearch allListSearch = snapshot.data![index];
                          return ProductSearchWidget(
                            allSearchList: allListSearch,
                          );
                        },
                      );
                    }
                    return const Text("data");
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
