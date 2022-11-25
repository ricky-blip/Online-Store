import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';
import 'package:ricky_store/app/data/models/product/product_list_model.dart';
import 'package:ricky_store/app/data/models/merk/merk_list_model.dart';
import 'package:ricky_store/app/modules/PRODUCTS/products_merk/controllers/products_merk_controller.dart';
import 'package:ricky_store/app/modules/PRODUCTS/products_merk/views/products_merk_view.dart';
import 'package:ricky_store/app/modules/PRODUCTS/products_merk/widgets/products_merk_chip_widget.dart';
import 'package:ricky_store/app/modules/PRODUCTS/products_search/controllers/products_search_controller.dart';
import 'package:ricky_store/app/modules/PRODUCTS/products_search/views/products_search_view.dart';
import 'package:ricky_store/app/shared/constant/color.dart';

import '../controllers/products_list_controller.dart';
import '../widgets/products_list_widgets.dart';

// ignore: must_be_immutable
class ProductsListView extends GetView<ProductsListController> {
  ProductsListView({Key? key}) : super(key: key);
  final pSearchController = Get.put(ProductsSearchController());
  final pMerkController = Get.put(ProductsMerkController());

  String merkLabel = "merk";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appScaffoldBlue,
      appBar: AppBar(
        flexibleSpace: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 57, right: 2, top: 3, bottom: 3),
            child: Container(
              // width: MediaQuery.of(context).size.width * 0.87,
              // height: MediaQuery.of(context).size.height * 0.8,
              // color: Colors.amber,
              child: TextField(
                controller: pSearchController.keywordInput,
                autofocus: true,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      Get.to(
                        ProductsSearchView(
                          keywordInput: pSearchController.keywordInput.text,
                        ),
                      );
                      pSearchController.keywordInput.clear();
                    },
                    icon: const Icon(
                      Icons.search,
                      size: 30,
                    ),
                  ),
                  hintText: "Search",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
            ),
          ),
        ),
        backgroundColor: appScaffoldBlue,
        iconTheme: IconThemeData(color: appBlack),
        elevation: 0,
        actions: [],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                //SECTION CHIP Product Merk
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FutureBuilder<List<MerkList>>(
                    future: pMerkController.getMerk(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Text("Waiting");
                      } else if (snapshot.hasData) {
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ...snapshot.data!.map(
                                (e) => GestureDetector(
                                  onTap: () => Get.to(
                                    ProductsMerkView(merkId: e.id),
                                  ),
                                  child: MerkChipWidget(
                                    merk: e,
                                    colorChip: appWhite,
                                    iconChip: const Icon(Icons.laptop),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      } else if (snapshot.data!.isEmpty) {
                        return const Text("Data Kosong");
                      } else if (snapshot.hasError) {
                        return const Text("Koneksi Error");
                      }
                      return const SizedBox();
                    },
                  ),
                ),

                //SECTION Product List
                FutureBuilder<List<ProductList>>(
                  future: controller.getProductAllList(),
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
                          ProductList allListProducts = snapshot.data![index];
                          return ProductListWidget(
                            allProductList: allListProducts,
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
