import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ricky_store/app/data/models/product/product_search_model.dart';
import 'package:ricky_store/app/modules/PRODUCTS/products_merk/widgets/products_merk_rating_widget.dart';
import 'package:ricky_store/app/modules/PRODUCTS/products_search/widgets/products_search_rating_widget.dart';
import 'package:ricky_store/app/shared/config/config.dart';
import 'package:ricky_store/app/shared/constant/color.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import '../controllers/products_detail_controller.dart';

// ignore: must_be_immutable
class ProductsDetailSearchView extends GetView<ProductsDetailController> {
  ProductsDetailSearchView({super.key, required this.productSearchDetails});
  final ProductSearch productSearchDetails;

  final pdetailsC = Get.lazyPut(() => ProductsDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appScaffoldBlue,
      appBar: AppBar(
        // backgroundColor: appScaffoldBlue,
        title: const Text("Detail Product"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Stack(
            children: [
              //NOTE Stack 1
              Image.network(
                productSearchDetails.gambar,
                width: MediaQuery.of(context).size.width,
                height: 350,
                fit: BoxFit.cover,
              ),
              //NOTE Stack 2
              ListView(
                children: [
                  const SizedBox(height: 263),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: appScaffoldBlue,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: appBlue.withOpacity(0.5),
                          spreadRadius: 10,
                          blurRadius: 10,
                          offset:
                              const Offset(0, 9), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 12,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              width: 100,
                              height: 6,
                              decoration: BoxDecoration(
                                color: appBlack,
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          //NOTE Section 1
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${productSearchDetails.merk.merkProduct} ${productSearchDetails.namaProduct}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      fontFamily: "Poppins",
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  //NOTE STAR
                                  Row(
                                    children: [
                                      RatingsWidgetProductSearch(
                                        starRatings: productSearchDetails,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              // NOTE BUTTON + -
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          controller.decrement();
                                        },
                                        child: const Icon(
                                          Icons.remove_circle_outline_outlined,
                                          size: 40,
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Obx(
                                        () => Text(
                                          "${controller.quantity}",
                                          style: const TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      GestureDetector(
                                        onTap: () {
                                          controller.increment();
                                        },
                                        child: const Icon(
                                          Icons.add_circle_outline_outlined,
                                          size: 40,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          //NOTE Section 2
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 31),
                              const Text(
                                "Deskripsi",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 12),
                              HtmlWidget(productSearchDetails.spesifikasi),
                              const SizedBox(height: 30),
                              const Text(
                                "Spesifikasi",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 12),
                              HtmlWidget(productSearchDetails.spesifikasi),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      //NOTE Bottom Navigation Bar
      bottomNavigationBar: BottomAppBar(
        color: appScaffoldBlue,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Total Price: ",
                      style: TextStyle(
                        color: appBlack,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      Config.convertToIdr(productSearchDetails.harga, 0),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: appSoftBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        // _orderNowC.postKeranjang(widget.product.id, quantity);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => OrderNow(),
                        //   ),
                        // );
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 45,
                        child: const Center(
                          child: Text(
                            "Order Now",
                            style: TextStyle(
                              fontSize: 20,
                              color: appWhite,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
