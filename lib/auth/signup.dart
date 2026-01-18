import 'package:flutter/material.dart';
import 'login.dart';

class account {
  String name_account;
  String password;
  account(this.name_account, this.password);
}

List<account> accounts = [];

class Signup extends StatelessWidget {
  Signup({super.key});

  TextEditingController name = TextEditingController();
  TextEditingController pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("تسجيل حساب"), centerTitle: true),
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
                        decoration: const InputDecoration(
                          labelStyle: TextStyle(),
                          hintText: "ادخل اسم المستخدم",
                          labelText: "المستخدم",
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
                        decoration: const InputDecoration(
                          hintText: "ادخل كلمة المرور ",
                          labelText: "كلمة المرور",
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
                onPressed: () {
                  if (name.text.isNotEmpty && pass.text.isNotEmpty) {
                    accounts.add(account(name.text, pass.text));
                    name.clear();
                    pass.clear();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                      (route) => false,
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("ادخل اسم المستخدم وكلمة المرور"),
                      ),
                    );
                  }
                },
                child: Text(
                  "                    انشاء حساب                    ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GestureDetector(
                child: const Text(
                  "تسجيل الدخول",
                  style: TextStyle(
                    color: Colors.blue,
                    decorationColor: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                    (route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
