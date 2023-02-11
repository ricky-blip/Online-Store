import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ricky_store/app/data/models/product/product_recommended_model.dart';
import 'package:ricky_store/app/modules/STARTED/home/views/home_view.dart';
import 'package:ricky_store/app/routes/app_pages.dart';
import 'package:sp_util/sp_util.dart';

import '../../../../shared/constant/color.dart';
import '../../../../data/models/product/product_new_model.dart';

import '../controllers/landing_page_controller.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../widgets/new_products_widget.dart';
import '../widgets/recommended_products_widget.dart';

class LandingPageView extends GetView<LandingPageController> {
  LandingPageView({Key? key}) : super(key: key);
  final lpC = Get.lazyPut(() => LandingPageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appScaffoldBlue,
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                //SECTION TopBar
                Padding(
                  padding: const EdgeInsets.only(
                    left: 25,
                    right: 25,
                    top: 20,
                    bottom: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        //jika spUtil nya kosong "" tampilkan Welcome, selain itu(jika login) tampilkan nama user
                        SpUtil.getString("name_user").toString() == ""
                            ? "Welcome"
                            : "Welcome Back, ${SpUtil.getString("name_user")}",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const CircleAvatar(
                        backgroundImage:
                            NetworkImage("https://i.pravatar.cc/300"),
                        minRadius: 10,
                        maxRadius: 20,
                      ),
                      // GestureDetector(
                      //   onTap: () {},
                      //   child: const CircleAvatar(
                      //     foregroundColor: appSoftBlue,
                      //     // backgroundColor: Colors.grey,
                      //     child: Icon(
                      //       Icons.info,
                      //       size: 40,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),

                //SECTION New Products Text
                Padding(
                  padding: const EdgeInsets.only(
                    top: 0,
                    left: 25,
                    right: 25,
                    bottom: 15,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "New Products",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Icon(
                        Icons.fiber_new_sharp,
                        color: appRed,
                      ),
                    ],
                  ),
                ),

                //SECTION New Product
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 0,
                      left: 15,
                      right: 15,
                      bottom: 0,
                    ),
                    child: FutureBuilder<List<ProductNew>>(
                      future: controller.getProductNew("new"),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Text("Waiting . . .");
                        } else if (snapshot.hasData) {
                          return Row(
                            children: [
                              ...snapshot.data!.map(
                                (e) => NewProductsWidget(newProduct: e),
                              ),
                            ],
                          );
                        }

                        return const Text("data");
                      },
                    ),
                  ),
                ),

                //SECTION Products Recommended Text
                Padding(
                  padding: const EdgeInsets.only(
                    top: 38,
                    left: 25,
                    right: 25,
                    bottom: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Recommended",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed(Routes.PRODUCTS_LIST),
                        child: Text(
                          "See More",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: appBlue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //SECTION Products Recommended
                FutureBuilder<List<ProductRecommended>>(
                  future: controller.getProductRecommended("recommended"),
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
                          ProductRecommended products = snapshot.data![index];
                          return RecommendedProductsWidget(
                            recommendedW: products,
                          );
                        },
                      );
                    }

                    return const Text("data");
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
