import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';
import 'package:ricky_store/app/data/models/merk/merk_product_model.dart';
import 'package:ricky_store/app/modules/PRODUCTS/products_merk/widgets/products_merk_widgets.dart';
import 'package:ricky_store/app/shared/constant/color.dart';

import '../controllers/products_merk_controller.dart';

class ProductsMerkView extends GetView<ProductsMerkController> {
  final int merkId;
  const ProductsMerkView({super.key, required this.merkId});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appScaffoldBlue,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: appBlack,
        ),
        backgroundColor: appScaffoldBlue,
        title: const Text(
          "Detail Product",
          style: TextStyle(
            color: appBlack,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          FutureBuilder<List<MerkProduct>>(
                            future:
                                controller.productByMerkId(merkId.toString()),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: Column(
                                    children: const [
                                      CircularProgressIndicator(
                                        backgroundColor: appScaffoldBlue,
                                      ),
                                    ],
                                  ),
                                );
                              } else if (snapshot.hasData) {
                                return AlignedGridView.count(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  crossAxisCount: 2,
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, index) {
                                    MerkProduct allListProductsMerk =
                                        snapshot.data![index];
                                    return ProductMerkWidget(
                                        allProductMerk: allListProductsMerk);
                                  },
                                );
                              } else if (snapshot.data!.isEmpty) {
                                return const Text("Data Kosong");
                              } else if (snapshot.hasError) {
                                return const Text("Koneksi Error");
                              }
                              return const Center(
                                child: CircularProgressIndicator(
                                  backgroundColor: appScaffoldBlue,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
