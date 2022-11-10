import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ricky_store/app/routes/app_pages.dart';
import 'package:ricky_store/app/shared/constant/color.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appScaffoldBlue,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: appBlack),
        backgroundColor: appScaffoldBlue,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "don't have an account yet?",
                  style: Get.textTheme.subtitle2,
                ),
                TextButton(
                  onPressed: () {
                    Get.offNamed(Routes.REGISTER);
                  },
                  child: Text(
                    "Register Now",
                    style: Get.textTheme.subtitle1,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
              top: 80,
              bottom: 80,
            ),
            child: Column(
              children: [
                Column(
                  children: [
                    Text(
                      "Welcome Back !",
                      style: Get.textTheme.headline5,
                    ),
                    SizedBox(height: 5),
                    Text(
                      "You have been missed",
                      style: Get.textTheme.titleSmall,
                    ),
                  ],
                ),
                SizedBox(height: 50),
                //NOTE Email
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
                      controller: controller.email,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Email",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 21),
                //NOTE Password
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
                    child: Obx(
                      () => TextField(
                        controller: controller.password,
                        obscureText: controller.obscure.value,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password",
                          suffixIcon: IconButton(
                            onPressed: () {
                              controller.isObscure();
                            },
                            icon: Icon(
                              controller.obscure.value == true
                                  ? Icons.remove_red_eye_sharp
                                  : Icons.visibility_off,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 31),
                //NOTE Section 3 (BUTTON SIGN IN)
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Obx(
                    () => ElevatedButton(
                      onPressed: () {
                        controller.login();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: appSoftBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: controller.isLoading.value == true
                          ? const CircularProgressIndicator(
                              color: appWhite,
                            )
                          : const Text(
                              "Sign In",
                              style: TextStyle(fontSize: 20),
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
