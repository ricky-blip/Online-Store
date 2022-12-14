import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ricky_store/app/routes/app_pages.dart';
import 'package:ricky_store/app/shared/constant/color.dart';
import 'package:sp_util/sp_util.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({Key? key}) : super(key: key);

  final profileController = Get.lazyPut(() => ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appScaffoldBlue,
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(45.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        decoration: BoxDecoration(
                          color: appSoftBlue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Container(
                        child: Center(
                          child: Column(
                            children: [
                              const CircleAvatar(
                                backgroundImage:
                                    NetworkImage("https://i.pravatar.cc/300"),
                                minRadius: 70,
                                maxRadius: 100,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                // NOTE get spUtil ke name Profile
                                "${SpUtil.getString("name_user").toString()} ",
                                style: const TextStyle(
                                  fontSize: 24,
                                  color: appWhite,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                SpUtil.getString("email_user").toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  color: appWhite,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(Routes.REGISTER);
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: appBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(Routes.LOGIN);
                      },
                      child: Text(
                        "Change Account",
                        style: TextStyle(fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: appBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.logout();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: appRed,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: const Text(
                        "Log Out",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
