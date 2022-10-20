import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';
import 'package:ricky_store/app/data/models/products/product_list_model.dart';
import 'package:ricky_store/app/shared/constant/color.dart';

import '../controllers/products_list_controller.dart';
import '../widgets/products_list_widgets.dart';

class ProductsListView extends GetView<ProductsListController> {
  const ProductsListView({Key? key}) : super(key: key);
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
                    left: 25,
                    right: 25,
                    top: 20,
                    bottom: 35,
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back,
                          size: 40,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            decoration: InputDecoration(
                              suffixIcon: const Icon(Icons.search),
                              hintText: "Search Products",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //SECTION Product List
                FutureBuilder<List<ProductList>>(
                  future: controller.getProductAllList(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text("Waiting Data . . .");
                    } else if (snapshot.hasData) {
                      return AlignedGridView.count(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          int sequence = index + 1;
                          ProductList allListProducts = snapshot.data![index];
                          return ProductListWidget(
                            allProductList: allListProducts,
                          );
                        },
                      );
                    }

                    return Text("data");
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
