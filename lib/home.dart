import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:untitled2/drawer/amount.dart';
import 'package:untitled2/drawer/favoritepay.dart';
import 'package:untitled2/drawer/payment.dart';
import 'package:untitled2/notificationpage.dart';
import 'package:untitled2/send/send.dart';
import 'package:untitled2/send/send2.dart';
import 'package:untitled2/send/wallet/wallet.dart';
import 'profile/profile.dart';
import 'package:get/get.dart';
import 'package:untitled2/Translations/locale_strings.dart';

String s = "";
Color cs = Colors.white;

//جبران سليمان احمد
class Home extends StatelessWidget {
  String namein = "";
  Home({required this.namein});

  Color c = Colors.red;

  Container buildlistetile(context, txt, Icon i, Color co, {Function()? p}) {
    return Container(
      child: ListTile(
        title: Text(
          txt,
          style: const TextStyle(),
          textDirection: TextDirection.rtl,
        ),
        tileColor: co,
        trailing: i,
        onTap: () {
          // Navigator.of(
          //   context,
          // ).push(MaterialPageRoute(builder: (context) => const Page1()));
          if (p != null) {
            Get.to(p());
          }
          s = txt;
          cs = co;
        },
      ),
    );
  }

  SizedBox sz(double? z) {
    return SizedBox(height: z);
  }

  Text title(txt) {
    return Text(txt, style: TextStyle(), textDirection: TextDirection.rtl);
  }

  Color maincolor = Color.fromARGB(255, 216, 221, 234);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincolor,
      endDrawer: Drawer(
        backgroundColor: maincolor,
        child: ListView(
          children: [
            Center(child: Text('drawer_title'.tr)),
            sz(10),
            title('invest_mgmt'.tr),
            sz(5),
            buildlistetile(
              context,
              "pay_prefs".tr,
              const Icon(Icons.favorite),
              const Color(0xffffffff),
              p: () => Favoritepay(),
            ),
            buildlistetile(
              context,
              "add_bank".tr,
              const Icon(Icons.add),
              const Color(0xffffffff),
            ),
            sz(5),
            title('send_pay'.tr),
            sz(5),
            buildlistetile(
              context,
              "send_paypal".tr,
              const Icon(Icons.send),
              const Color(0xffffffff),
              p: () => Send2(),
            ),
            buildlistetile(
              context,
              "pay_bills".tr,
              const Icon(Icons.payment),
              const Color(0xffffffff),
              p: () => Payment(),
            ),
            sz(5),
            title('receive_pay'.tr),
            sz(5),
            buildlistetile(
              context,
              "req_money".tr,
              const Icon(Icons.request_page),
              const Color(0xffffffff),
              p: () => Send2(),
            ),
            sz(5),
            title('profile_support'.tr),
            sz(5),
            buildlistetile(
              context,
              "profile".tr,
              const Icon(Icons.portrait_sharp),
              const Color(0xffffffff),
              p: () => Profile(namein: namein),
            ),
            buildlistetile(
              context,
              "wallet".tr,
              const Icon(Icons.account_balance_wallet_outlined),
              const Color(0xffffffff),
              p: () => Wallet(),
            ),
            sz(20),
            ListTile(
              tileColor: Colors.white,
              title: Text("English", textDirection: TextDirection.rtl),
              onTap: () => Get.updateLocale(const Locale('en', 'US')),
            ),
            sz(20),
            ListTile(
              tileColor: Colors.white,
              title: Text("عربي", textDirection: TextDirection.rtl),
              onTap: () => Get.updateLocale(const Locale('ar', 'SA')),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: maincolor,
        // centerTitle: true,
        // title: const Text("PayPal"),
        leading: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Profile(namein: namein),
                  ),
                  (route) => true,
                );
              },
              icon: const Icon(
                Icons.person_outline_sharp,
                fill: 0.50,
                color: Colors.blue,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Notificationpage()),
                );
              },
              icon: const Icon(
                Icons.notifications_none,
                fill: 0.50,
                color: Colors.blue,
              ),
            ),
          ],
        ),
        leadingWidth: 100,
      ),
      body: ListView(
        children: [
          sz(20),
          CarouselSlider(
            options: CarouselOptions(
              height: 180.0,
              enlargeCenterPage: true,
              autoPlay: true,
              viewportFraction: 0.8,
            ),
            items: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF003087),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    "${'paypal_balance'.tr}\n \$0.00",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    "${"visa_card".tr}\n **** 5544",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          sz(20),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ListTile(
              onTap: () => Get.to(Amount()),
              title: const Text(
                "0.00 USD",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                textDirection: TextDirection.rtl,
              ),
              trailing: const Image(
                image: AssetImage("images/paypal_icon.png"),
                width: 20,
              ),
              subtitle: Text(
                "paypal_balance".tr,
                textDirection: TextDirection.rtl,
              ),
              tileColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(10),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ListTile(
              title: Text(
                "add_info".tr,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textDirection: TextDirection.rtl,
              ),
              trailing: const Image(
                image: AssetImage("images/paypal_icon.png"),
                width: 20,
              ),
              subtitle: Text(
                "add_info".tr,
                textDirection: TextDirection.rtl,
              ),
              tileColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(10),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xffffffff),
        onTap: (value) {
          switch (value) {
            case 0:
              Get.off(Wallet());
              break;
            case 1:
              Get.off(Send(namein: namein));
              break;
            case 2:
              Get.to(Home(namein: namein));
              break;
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.wallet), label: "wallet".tr),
          BottomNavigationBarItem(icon: Icon(Icons.send), label: "send_req".tr),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home".tr),
        ],
      ),
    );
  }
}
