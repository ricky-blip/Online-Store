import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:ricky_store/app/constant/color.dart';
import 'package:ricky_store/app/modules/landing_page/views/landing_page_view.dart';
import 'package:ricky_store/app/modules/order/views/order_view.dart';
import 'package:ricky_store/app/widgets/new_products_widget.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appScaffoldBlue,
      body: Obx(() {
        return controller.screen[controller.currentTab.value];
      }),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: appBlue,
        color: appScaffoldBlue,
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.shopping_bag_rounded, title: 'Orders'),
          TabItem(icon: Icons.person, title: 'Profile'),
        ],
        initialActiveIndex: controller.currentTab.value,
        onTap: (int i) => controller.currentTab.value = i,
      ),
    );
  }
}
