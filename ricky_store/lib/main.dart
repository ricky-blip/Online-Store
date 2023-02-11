import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ricky_store/app/shared/constant/color.dart';

import 'app/routes/app_pages.dart';
import 'package:sp_util/sp_util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.getInstance();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ricky's Online Store",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            color: appBlack,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: TextStyle(
            color: appBlack,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: TextStyle(
            color: appBlack,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),
  );
}
