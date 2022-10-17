import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ricky_store/app/constant/color.dart';
import 'package:ricky_store/app/widgets/new_products_widget.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
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
                          child: CircleAvatar(
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
                    ],
                  ),
                ),

                //SECTION Products Recommended Text
              ],
            ),
          ],
        ),
      ),
    );
  }
}
