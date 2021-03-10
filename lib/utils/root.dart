import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo2ndtest/controllers/authController.dart';
import 'package:todo2ndtest/controllers/userController.dart';
import 'package:todo2ndtest/screens/home.dart';
import 'package:todo2ndtest/screens/login.dart';

class Root extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    // ToDo: implement build
    return GetX(
      initState: (_) {
        Get.put<UserController>(UserController());
      },
      builder: (_) {
        // Routing base on user UID in FireBase :::::::::::::::::::::::::::::::::
        if (Get.find<AuthController>().userGetter?.uid != null) {
          return Home();
        } else {
          return Login();
        }

        // Routing base on userEmail (String Getter ) in FireBase:::::::::::::::
        // if (Get.find<AuthController>().userGetter != null) {
        //   return Home();
        // } else {
        //   return Login();
        // }
      },
    );
    //     Obx(() {
    //   return (Get.find<AuthController>().userGetter != null) ? Home() : Login();
    // });
  }
}
