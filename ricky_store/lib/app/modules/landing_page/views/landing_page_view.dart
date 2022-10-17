import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ricky_store/app/widgets/recommended_products_widget.dart';

import '../../../constant/color.dart';
import '../../../widgets/new_products_widget.dart';
import '../controllers/landing_page_controller.dart';

class LandingPageView extends GetView<LandingPageController> {
  const LandingPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appScaffoldBlue,
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                //SECTION AppBar
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
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 25,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "New Products",
                        style: Get.textTheme.headline6,
                      ),
                    ],
                  ),
                ),

                //SECTION New Product
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      NewProductsWidget(),
                      NewProductsWidget(),
                      NewProductsWidget(),
                    ],
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
                        "Recommended Products",
                        style: Get.textTheme.headline6,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: appBlue,
                        ),
                        onPressed: () {},
                        child: Row(
                          children: [
                            Text("More"),
                            Icon(Icons.forward),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                //SECTION Products Recommended
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          RecommendedProductsWidget(),
                          RecommendedProductsWidget(),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
