import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:ricky_store/app/modules/Authentication/login/controllers/login_controller.dart';
import 'package:ricky_store/app/shared/constant/color.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  final loginC = Get.put(LoginController());
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
          TabItem(icon: Icons.shopping_cart_rounded, title: 'Cart'),
          TabItem(icon: Icons.person, title: 'Profile'),
        ],
        initialActiveIndex: controller.currentTab.value,
        onTap: (int i) => controller.currentTab.value = i,
      ),
    );
  }
}
