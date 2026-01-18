import 'package:flutter/material.dart';

class Send2 extends StatelessWidget {
  const Send2({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 216, 221, 234),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 216, 221, 234),
          title: TextField(
            decoration: InputDecoration(
              hintTextDirection: TextDirection.ltr,
              hintText: "Name,username,email,mobile",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          // centerTitle: true,
        ),
        body: ListView(
          children: [
            SizedBox(height: 100),
            Center(
              child: Text(
                "لنبحث عن جهات الاتصال لديك",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                textDirection: TextDirection.rtl,
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                "ابحث بالاسم او اسم المستخدم او البريد الالكتروني او رقم \n الهاتف, او بتفعيل حهات الاتصال الديك",
                style: TextStyle(fontSize: 16),
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.account_box_outlined, color: Colors.blue),
                SizedBox(width: 10),
                Text(
                  "تغعيل جهات الاتصال لديك",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
