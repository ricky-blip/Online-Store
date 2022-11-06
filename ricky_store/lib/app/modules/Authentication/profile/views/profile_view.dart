import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ricky_store/app/shared/constant/color.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appScaffoldBlue,
      body: SafeArea(
        child: Padding(
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
                  Spacer(),
                  Container(
                    child: Center(
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                NetworkImage("https://i.pravatar.cc/300"),
                            minRadius: 70,
                            maxRadius: 100,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            //NOTE menambahkan spUtil ke name Profile
                            // SpUtil.getString("name_user").toString(),
                            "Name",
                            style: TextStyle(
                              fontSize: 24,
                              color: appWhite,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Email",
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
              Spacer(),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
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
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
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
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Log Out",
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: appRed,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
