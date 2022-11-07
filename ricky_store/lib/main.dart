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
          subtitle1: TextStyle(
            color: appBlue,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),
  );
}
