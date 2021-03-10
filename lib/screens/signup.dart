import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo2ndtest/controllers/authController.dart';

class SignUp extends GetWidget<AuthController> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(hintText: "Full Name"),
                  controller: nameController,
                ),
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Email"),
                  controller: emailController,
                ),
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Password"),
                  obscureText: true,
                  controller: passwordController,
                ),
                MaterialButton(
                  color: Colors.yellowAccent,
                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    controller.createUser(
                        emailController.text, passwordController.text, nameController.text);
                  },
                ),
                MaterialButton(
                  // color: Colors.yellowAccent,
                  child: Text(
                    "Log in",
                    style: TextStyle(color: Colors.yellowAccent),
                  ),
                  onPressed: () {
                    Get.back();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
