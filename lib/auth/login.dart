import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paypal_application/Database/DatabaseHelper.dart';
import 'package:paypal_application/home.dart';
import 'signup.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  Login({super.key});

  TextEditingController name = TextEditingController();
  TextEditingController pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 216, 221, 234),
      appBar: AppBar(
        title: Text("login_title".tr),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 216, 221, 234),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
                top: 10,
                bottom: 10,
              ),
              child: TextField(
                controller: name,
                decoration: InputDecoration(
                  hintTextDirection: TextDirection.rtl,
                  labelStyle: TextStyle(),
                  hintText: "enter_usernamelogn".tr,
                  labelText: "usernamelogn_label".tr,
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
                top: 10,
                bottom: 10,
              ),
              child: TextField(
                controller: pass,
                decoration: InputDecoration(
                  hintTextDirection: TextDirection.rtl,
                  hintText: "enter_password".tr,
                  labelText: "password_label".tr,
                  prefixIcon: Icon(Icons.password),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.black),
              ),
              onPressed: () async {
                if (name.text.isNotEmpty && pass.text.isNotEmpty) {
                  // var confg = accounts.where(
                  //   (a) =>
                  //       a.name_account == name.text && a.password == pass.text,
                  // );
                  var confg = await DatabaseHelper.instance.loginUser(
                    name.text,
                    pass.text,
                  );
                  if (confg != null) {
                    Get.offAll(Home(namein: confg['name'],userid: confg['id'],));
                  } else {
                    Get.snackbar("error".tr, "invalid_credentials".tr);
                  }
                } else {
                  Get.snackbar('error'.tr, 'enter_credentials'.tr);
                }
              },
              child: Text(
                "login_button".tr,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.white),
              ),
              onPressed: () {
                Get.off(Signup());
              },
              child: Text(
                "signup_button".tr,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
