import 'package:flutter/material.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 216, 221, 234),
        appBar: AppBar(
          title: Text("الفواتير"),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 216, 221, 234),
        ),
        body: Column(
          children: [
            SizedBox(height: 40),
            Center(
              child: Text(
                "ستظهر هنا الفواتير التي يمكن سدادها عبر  PayPal مثل \nالاشتراكات وطلبات المدفوعات",
                style: TextStyle(fontSize: 16),
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
