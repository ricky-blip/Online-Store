import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ricky_store/app/shared/constant/color.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appScaffoldBlue,
      appBar: AppBar(
        iconTheme: IconThemeData(color: appBlack),
        backgroundColor: appScaffoldBlue,
        elevation: 0,
        title: Text(
          'Register',
          style: Get.textTheme.headline5,
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 50,
            ),
            child: Column(
              children: [
                //NOTE Name
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 10,
                      bottom: 10,
                    ),
                    child: TextField(
                      // controller: authC.namaLengkap,
                      // style: greyTextStyle.copyWith(fontSize: 12),
                      style: Get.textTheme.subtitle1,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Full Name",
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 21),
                //NOTE Email
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 10,
                      bottom: 10,
                    ),
                    child: TextField(
                      // controller: authC.namaLengkap,
                      // style: greyTextStyle.copyWith(fontSize: 12),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Email",
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 21),
                //NOTE Password
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 10,
                      bottom: 10,
                    ),
                    child: TextField(
                      // controller: authC.namaLengkap,
                      // style: greyTextStyle.copyWith(fontSize: 12),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 31),
                //NOTE Section 3 (BUTTON SIGN IN)
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: appSoftBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
