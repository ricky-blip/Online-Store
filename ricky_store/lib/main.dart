import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ricky_store/app/constant/color.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ricky's Store Apps",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        backgroundColor: Colors.black,
        textTheme: const TextTheme(
          headline5: TextStyle(
            color: appBlack,
            fontWeight: FontWeight.w500,
          ),
          headline6: TextStyle(
            color: appBlack,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}
