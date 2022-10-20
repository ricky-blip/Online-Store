import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

import 'package:get/get.dart';
import 'package:ricky_store/app/data/models/products/product_recommended_model.dart';
import 'package:ricky_store/app/routes/app_pages.dart';

import '../../../shared/constant/color.dart';
import '../../../data/models/products/product_new_model.dart';

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
                    bottom: 35,
                  ),
                  child: Container(
                    // color: Colors.amber,
                    // height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Hi, User",
                          style: Get.textTheme.headline5,
                        ),
                        // Spacer(),
                        GestureDetector(
                          onTap: () {},
                          child: const CircleAvatar(
                            foregroundColor: appBlue,
                            // backgroundColor: Colors.grey,
                            child: Icon(
                              Icons.account_circle,
                              size: 40,
                            ),
                          ),
                        ),
                      ],
                    ),
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
                        style: Get.textTheme.headline6,
                      ),
                      Icon(
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
                          return Text("Waiting . . .");
                        } else if (snapshot.hasData) {
                          return Row(
                            children: [
                              ...snapshot.data!.map(
                                (e) => NewProductsWidget(newProduct: e),
                              ),
                            ],
                          );
                        }

                        return Text("data");
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
                        style: Get.textTheme.headline6,
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed(Routes.PRODUCTS_LIST),
                        child: Text(
                          "See More",
                          style: Get.textTheme.subtitle1,
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
                      return Text("Waiting Data . . .");
                    } else if (snapshot.hasData) {
                      return AlignedGridView.count(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          int sequence = index + 1;
                          ProductRecommended products = snapshot.data![index];
                          return RecommendedProductsWidget(
                            recommendedW: products,
                          );
                        },
                      );
                    }

                    return Text("data");
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
