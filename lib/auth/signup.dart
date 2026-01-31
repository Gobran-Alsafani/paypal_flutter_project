import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paypal_application/Database/databasehelper.dart';
import 'package:paypal_application/home.dart';
import 'login.dart';

// ignore: must_be_immutable
class Signup extends StatelessWidget {
  Signup({super.key});

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController pass = TextEditingController();

  final db = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("signup_title".tr), centerTitle: true),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Column(
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
                          labelStyle: TextStyle(),
                          hintText: "enter_username".tr,
                          labelText: "username_label".tr,
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
                        controller: email,
                        decoration: InputDecoration(
                          hintText: "enter_email".tr,
                          labelText: "email_label".tr,
                          prefixIcon: Icon(Icons.email),
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
                        controller: phone,
                        decoration: InputDecoration(
                          hintText: "enter_phone".tr,
                          labelText: "phone_label".tr,
                          prefixIcon: Icon(Icons.phone),
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
                          hintText: "enter_password".tr,
                          labelText: "password_label".tr,
                          prefixIcon: Icon(Icons.password),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.black),
                ),
                onPressed: () async {
                  if (name.text.isNotEmpty && pass.text.isNotEmpty) {
                    // accounts.add(account(name.text, pass.text));
                    int userID = await db.insertUser({
                      'name': name.text,
                      'email': email.text,
                      'phone': phone.text,
                      'password': pass.text,
                      'created_at': DateTime.now().toIso8601String(),
                    });
                    await db.createWallet(userID);
                    Get.offAll(Home(namein: name.text, userid: userID));
                  } else {
                    Get.snackbar('error'.tr, 'enter_credentials'.tr);
                  }
                },
                child: Text(
                  "create_account".tr,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GestureDetector(
                child: Text(
                  "login_button".tr,
                  style: TextStyle(
                    color: Colors.blue,
                    decorationColor: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
                onTap: () {
                  Get.off(Login());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
