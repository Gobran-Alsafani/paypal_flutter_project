import 'package:flutter/material.dart';

class Favoritepay extends StatelessWidget {
  const Favoritepay({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 216, 221, 234),
        appBar: AppBar(backgroundColor: Color.fromARGB(255, 216, 221, 234)),
        body: ListView(
          children: [
            Text(
              "مفضلة للدفع الكترونياً",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "سوف نستخدم طريقة الدفع هذة عندما تتسوق على الانترنت او ترسل مدفوعات مقابل السلع والخدمات.",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "المزيد حول تفاصيل الدفع",
              style: TextStyle(
                fontSize: 16,
                color: Colors.blue,
                decoration: TextDecoration.underline,
                decorationColor: Colors.blue,
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Image(
                image: AssetImage("images/paypal_icon.png"),
                width: 20,
              ),
              title: Text("رصيد PayPal"),
              trailing: Icon(Icons.check),
            ),
          ],
        ),
      ),
    );
  }
}
