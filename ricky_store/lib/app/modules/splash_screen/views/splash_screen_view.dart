import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ricky_store/app/constant/color.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: appSoftBlue,
      body: Center(
        child: Text(
          "Welcome to Ricky's Store",
          style: TextStyle(
            fontSize: 20,
            color: appWhite,
          ),
        ),
      ),
    );
  }
}
