import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo2ndtest/controllers/authController.dart';
import 'package:todo2ndtest/controllers/userController.dart';
import 'package:todo2ndtest/services/database.dart';

class Home extends GetWidget<AuthController> {
  TextEditingController _todoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // ToDo: implement build
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100.0,
              ),
              Text("home"),
              GetX<UserController>(
                builder: (_) {
                  if (_.userGetter.email != null) {
                    return Text("Name:::"
                        " ${_.userGetter.name} \n"
                        "Email:::"
                        " ${_.userGetter.email}");
                  } else {
                    return Text("loading ......");
                  }
                },
              ),
              MaterialButton(
                color: Colors.yellowAccent,
                child: Text(
                  "SignOut",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  controller.signOut();
                  // Get.back();
                },
              ),
              Card(
                margin: EdgeInsets.all(20),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _todoController,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          if (_todoController.text != "") {
                            DataBase().addTodos(_todoController.text,
                                controller.userGetter.uid);
                            _todoController.clear();
                          }
                        },
                      )
                    ],
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
