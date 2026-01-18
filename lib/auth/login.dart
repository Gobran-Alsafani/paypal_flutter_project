import 'package:flutter/material.dart';
import 'package:untitled2/home.dart';
import 'signup.dart';

class Login extends StatelessWidget {
  Login({super.key});

  TextEditingController name = TextEditingController();
  TextEditingController pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 216, 221, 234),
      appBar: AppBar(
        title: const Text("تسجيل الدخول"),
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
                decoration: const InputDecoration(
                  hintTextDirection: TextDirection.rtl,
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
                  hintTextDirection: TextDirection.rtl,
                  hintText: "ادخل كلمة المرور ",
                  labelText: "كلمة المرور",
                  prefixIcon: Icon(Icons.password),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.black),
              ),
              onPressed: () {
                if (name.text.isNotEmpty && pass.text.isNotEmpty) {
                  var confg = accounts.where(
                    (a) =>
                        a.name_account == name.text && a.password == pass.text,
                  );
                  if (confg.isNotEmpty) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Home(namein: name.text),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("اسم المستخدم او كلمة المرور غير صحيحة"),
                      ),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("ادخل اسم المستخدم وكلمة المرور"),
                    ),
                  );
                }
              },
              child: Text(
                "                    تسجيل الدخول                    ",
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
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Signup()),
                  (route) => false,
                );
              },
              child: Text(
                "                    تسجيل الاشتراك                    ",
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
