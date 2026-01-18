import 'package:flutter/material.dart';
import 'package:untitled2/drawer/amount.dart';
import 'package:untitled2/home.dart';
import 'package:untitled2/send/send.dart';
import 'package:untitled2/page.dart';
import 'package:get/get.dart';

String s = "";
Color cs = Colors.white;

//جبران سليمان احمد
class Wallet extends StatelessWidget {
  String namein = "";
  Wallet();

  SizedBox sz(double? z) {
    return SizedBox(height: z);
  }

  Color maincolor = Color.fromARGB(255, 216, 221, 234);
  Color nouncolor = Color.fromARGB(255, 216, 221, 234);
  Color uncolor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincolor,
      appBar: AppBar(
        backgroundColor: maincolor,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          sz(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: nouncolor, width: 2),
                    ),
                  ),
                  child: Text(
                    "الانشطة",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ),
              SizedBox(width: 20),
              InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: uncolor, width: 2),
                    ),
                  ),
                  child: Text(
                    "المحفظة",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ),
            ],
          ),
          sz(20),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 250,
            margin: EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                Get.to(Amount());
              },
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image(
                          image: AssetImage("images/paypal_icon.png"),
                          width: 30,
                        ),
                      ),
                      Text(
                        "PayPal رصيد",
                        style: TextStyle(fontSize: 16),
                        textDirection: TextDirection.rtl,
                      ),
                      SizedBox(width: 160),
                      Text(
                        "\$0.00 USD",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  sz(30),
                  Text(
                    "0.00 USD",
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          sz(20),
          Text(
            "الحسابات البنكية وبطاقات الائتمان",
            style: TextStyle(fontSize: 18),
            textDirection: TextDirection.rtl,
          ),
          sz(10),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.all(10),
            height: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image(image: AssetImage("images/paypal_icon.png"), width: 70),
                Column(
                  children: [
                    sz(10),
                    Text(
                      "اضافة حسابات بنكية وبطاقات       ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    Text(
                      "اربط البطاقات للتسوق والدفع عبر \nPayPal واربط الحسابات البنكية للتحويل\nمن رصيدك على PayPal",
                      style: TextStyle(fontSize: 14),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
              ],
            ),
          ),
          sz(10),
          Text(
            "التفضيلات",
            style: TextStyle(fontSize: 18),
            textDirection: TextDirection.rtl,
          ),
          sz(10),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.all(10),
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ListTile(
                  title: const Text(
                    " المشتريات عبر الانترنت",
                    textDirection: TextDirection.rtl,
                  ),
                  subtitle: Text(
                    "رصيد PayPal",
                    textDirection: TextDirection.rtl,
                  ),
                  trailing: const Icon(Icons.shopping_bag),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text(
                    " المدفوعات التلقائية",
                    textDirection: TextDirection.rtl,
                  ),
                  trailing: const Icon(Icons.autorenew),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xffffffff),
        onTap: (value) {
          switch (value) {
            case 0:
              Get.to(Page1());
              break;
            case 1:
              Get.to(Send(namein: namein));
              break;
            case 2:
              Get.to(Home(namein: namein));
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.wallet), label: "المحفظة"),
          BottomNavigationBarItem(icon: Icon(Icons.send), label: "ارسال/طلب"),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "الصفحة الرئيسية",
          ),
        ],
      ),
    );
  }
}
