import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:paypal_application/Database/databasehelper.dart';
import 'package:paypal_application/controller/bottom_nav_controller.dart';
import 'package:paypal_application/controller/wallet_controller.dart';
import 'package:paypal_application/drawer/amount.dart';
import 'package:paypal_application/drawer/favoritepay.dart';
import 'package:paypal_application/drawer/payment.dart';
import 'package:paypal_application/notificationpage.dart';
import 'package:paypal_application/send/send2.dart';
import 'profile/profile.dart';
import 'package:get/get.dart';

//جبران سليمان احمد
// ignore: must_be_immutable
class Home extends StatelessWidget {
  var namein;
  var userid;
  Home({required this.namein, required this.userid});

  final Color c = Colors.red;
  final db = DatabaseHelper.instance;
  TextEditingController cordnum = TextEditingController();
  TextEditingController corddate = TextEditingController();
  TextEditingController cordccv = TextEditingController();

  Container buildlistetile(context, txt, Icon i, Color co, {Function()? p}) {
    return Container(
      child: ListTile(
        title: Text(txt, style: const TextStyle()),
        tileColor: co,
        trailing: i,
        onTap: () {
          if (p != null) {
            Get.back();
            Get.to(p());
          }
        },
      ),
    );
  }

  SizedBox sz(double? z) {
    return SizedBox(height: z);
  }

  Text title(txt) {
    return Text(txt, style: TextStyle());
  }

  final Color maincolor = Color.fromARGB(255, 216, 221, 234);
  final Color nouncolor = Color.fromARGB(255, 216, 221, 234);
  final Color uncolor = Colors.black;

  final BottomNavController controller = Get.put(BottomNavController());
  WalletController get walletController => Get.put(WalletController(userid));

  List<Widget> get pages => [
    ListView(
      children: [
        SizedBox(height: 20),
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
                  "${'paypal_balance'.tr}\n \$${walletController.balance.value}",
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
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(10),
          child: ListTile(
            onTap: () => Get.to(Amount()),
            title: Text(
              "USD ${walletController.balance}",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            leading: const Image(
              image: AssetImage("images/paypal_icon.png"),
              width: 20,
            ),
            subtitle: Text("paypal_balance".tr),
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
            ),
            leading: const Image(
              image: AssetImage("images/paypal_icon.png"),
              width: 20,
            ),
            subtitle: Text("add_info".tr),
            tileColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(10),
            ),
          ),
        ),
      ],
    ),
    ListView(
      children: [
        SizedBox(height: 20),
        Text(
          "send_request_title".tr,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        InkWell(
          onTap: () => Get.to(Send2(id: userid, name: namein)),
          child: Container(
            height: 50,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              children: [
                SizedBox(width: 10),
                Icon(Icons.search, color: Colors.grey),
                SizedBox(width: 10),
                Text(
                  "search_placeholder".tr,
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
        Center(
          child: Text(
            "send_intro_1".tr,
            style: TextStyle(fontSize: 22),

            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 10),
        Center(
          child: Text(
            "send_intro_2".tr,
            style: TextStyle(fontSize: 16),

            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
    ListView(
      children: [
        SizedBox(height: 10),
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
                  "activities".tr,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(width: 20),
            InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: uncolor, width: 2)),
                ),
                child: Text(
                  "wallet_label".tr,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
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
                    Text(
                      "USD ${walletController.balance}",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 170),
                    Text("paypal_balance".tr, style: TextStyle(fontSize: 16)),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image(
                        image: AssetImage("images/paypal_icon.png"),
                        width: 30,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10),
                Text(
                  "${walletController.balance} USD",
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
        Text("bank_accounts_cards".tr, style: TextStyle(fontSize: 18)),
        SizedBox(height: 10),
        InkWell(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.all(10),
            height: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    SizedBox(height: 10),
                    Text(
                      "add_bank_long".tr,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("bank_cards_note".tr, style: TextStyle(fontSize: 14)),
                  ],
                ),
                Image(image: AssetImage("images/paypal_icon.png"), width: 70),
              ],
            ),
          ),
          onTap: () {
            Get.bottomSheet(
              backgroundColor: Colors.white,
              Container(
                height: 200,
                child: Column(
                  children: [
                    ListTile(
                      title: Center(child: Text("add_to_wallet".tr)),
                      trailing: IconButton(
                        onPressed: Get.back,
                        icon: Icon(Icons.close),
                      ),
                    ),
                    ListTile(
                      title: Text("bank_accont".tr),
                      leading: Icon(Icons.food_bank_outlined),
                      subtitle: Text("bank_accont_sub".tr),
                    ),
                    ListTile(
                      title: Text("cait_card".tr),
                      leading: Icon(Icons.credit_card),
                      subtitle: Text("bank_accont_sub".tr),
                      onTap: () => Get.bottomSheet(
                        backgroundColor: Colors.white,
                        Container(
                          height: 170,
                          child: Column(
                            children: [
                              ListTile(
                                title: Center(child: Text("link_card".tr)),
                                trailing: IconButton(
                                  onPressed: () {
                                    Get.close(2);
                                  },
                                  icon: Icon(Icons.close),
                                ),
                                leading: IconButton(
                                  onPressed: Get.back,
                                  icon: Icon(Icons.arrow_back),
                                ),
                              ),
                              ListTile(
                                title: Text("scan_card".tr),
                                leading: Icon(Icons.camera_alt_outlined),
                              ),
                              ListTile(
                                title: Text("enter_card_details".tr),
                                leading: Icon(Icons.credit_card),
                                onTap: () => Get.bottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.white,
                                  Padding(
                                    padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(
                                        Get.context!,
                                      ).viewInsets.bottom,
                                    ),
                                    child: Container(
                                      height: 350,
                                      padding: EdgeInsets.all(15),
                                      child: Column(
                                        children: [
                                          ListTile(
                                            trailing: IconButton(
                                              onPressed: () => Get.close(3),
                                              icon: Icon(Icons.close),
                                            ),
                                            leading: IconButton(
                                              onPressed: Get.back,
                                              icon: Icon(Icons.arrow_back),
                                            ),
                                            title: Center(
                                              child: Text("link_a_card".tr),
                                            ),
                                          ),
                                          TextField(
                                            controller: cordnum,
                                            decoration: InputDecoration(
                                              labelText: "card_number".tr,
                                              prefixIcon: Icon(
                                                Icons.credit_card,
                                              ),
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                          SizedBox(height: 15),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: TextField(
                                                  controller: corddate,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        "expiration_date".tr,
                                                    border:
                                                        OutlineInputBorder(),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 10),
                                              Expanded(
                                                child: TextField(
                                                  controller: cordccv,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        "security_code".tr,
                                                    border:
                                                        OutlineInputBorder(),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 20),
                                          ElevatedButton(
                                            onPressed: () async {
                                              if (cordnum.text.isNotEmpty &&
                                                  corddate.text.isNotEmpty &&
                                                  cordccv.text.isNotEmpty) {
                                                await db.insertcard({
                                                  'user_id': userid,
                                                  'card_type': cordnum.text,
                                                  'last4': corddate.text,
                                                  'expiry': cordccv.text,
                                                });
                                                cordnum.clear();
                                                corddate.clear();
                                                cordccv.clear();
                                                Get.close(3);
                                              } else {
                                                Get.snackbar(
                                                  "erorr".tr,
                                                  'addcard_erorr'.tr,
                                                );
                                              }
                                            },
                                            child: Text(
                                              "link_card".tr,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.black,
                                              minimumSize: Size(
                                                double.infinity,
                                                50,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        SizedBox(height: 10),
        Text("التفضيلات", style: TextStyle(fontSize: 18)),
        SizedBox(height: 10),
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
                title: const Text(" المشتريات عبر الانترنت"),
                subtitle: Text("paypal_balance".tr),
                leading: const Icon(Icons.shopping_bag),
                onTap: () {},
              ),
              ListTile(
                title: const Text(" المدفوعات التلقائية"),
                leading: const Icon(Icons.autorenew),
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincolor,
      drawer: Drawer(
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
            ListTile(
              title: Text("add_bank".tr),
              tileColor: const Color(0xffffffff),
              trailing: const Icon(Icons.add),
              onTap: () {
                Get.bottomSheet(
                  backgroundColor: Colors.white,
                  Container(
                    height: 200,
                    child: Column(
                      children: [
                        ListTile(
                          title: Center(child: Text("add_to_wallet".tr)),
                          trailing: IconButton(
                            onPressed: Get.back,
                            icon: Icon(Icons.close),
                          ),
                        ),
                        ListTile(
                          title: Text("bank_accont".tr),
                          leading: Icon(Icons.food_bank_outlined),
                          subtitle: Text("bank_accont_sub".tr),
                        ),
                        ListTile(
                          title: Text("cait_card".tr),
                          leading: Icon(Icons.credit_card),
                          subtitle: Text("bank_accont_sub".tr),
                          onTap: () => Get.bottomSheet(
                            backgroundColor: Colors.white,
                            Container(
                              height: 170,
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Center(child: Text("link_card".tr)),
                                    trailing: IconButton(
                                      onPressed: () {
                                        Get.close(2);
                                      },
                                      icon: Icon(Icons.close),
                                    ),
                                    leading: IconButton(
                                      onPressed: Get.back,
                                      icon: Icon(Icons.arrow_back),
                                    ),
                                  ),
                                  ListTile(
                                    title: Text("scan_card".tr),
                                    leading: Icon(Icons.camera_alt_outlined),
                                  ),
                                  ListTile(
                                    title: Text("enter_card_details".tr),
                                    leading: Icon(Icons.credit_card),
                                    onTap: () => Get.bottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.white,
                                      Padding(
                                        padding: EdgeInsets.only(
                                          bottom: MediaQuery.of(
                                            Get.context!,
                                          ).viewInsets.bottom,
                                        ),
                                        child: Container(
                                          height: 350,
                                          padding: EdgeInsets.all(15),
                                          child: Column(
                                            children: [
                                              ListTile(
                                                trailing: IconButton(
                                                  onPressed: () => Get.close(3),
                                                  icon: Icon(Icons.close),
                                                ),
                                                leading: IconButton(
                                                  onPressed: Get.back,
                                                  icon: Icon(Icons.arrow_back),
                                                ),
                                                title: Center(
                                                  child: Text("link_a_card".tr),
                                                ),
                                              ),
                                              TextField(
                                                controller: cordnum,
                                                decoration: InputDecoration(
                                                  labelText: "card_number".tr,
                                                  prefixIcon: Icon(
                                                    Icons.credit_card,
                                                  ),
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                              SizedBox(height: 15),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: TextField(
                                                      controller: corddate,
                                                      decoration: InputDecoration(
                                                        labelText:
                                                            "expiration_date"
                                                                .tr,
                                                        border:
                                                            OutlineInputBorder(),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 10),
                                                  Expanded(
                                                    child: TextField(
                                                      controller: cordccv,
                                                      decoration: InputDecoration(
                                                        labelText:
                                                            "security_code".tr,
                                                        border:
                                                            OutlineInputBorder(),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 20),
                                              ElevatedButton(
                                                onPressed: () async {
                                                  if (cordnum.text.isNotEmpty &&
                                                      corddate
                                                          .text
                                                          .isNotEmpty &&
                                                      cordccv.text.isNotEmpty) {
                                                    await db.insertcard({
                                                      'user_id': userid,
                                                      'card_type': cordnum.text,
                                                      'last4': corddate.text,
                                                      'expiry': cordccv.text,
                                                    });
                                                    cordnum.clear();
                                                    corddate.clear();
                                                    cordccv.clear();
                                                    Get.close(3);
                                                  } else {
                                                    Get.snackbar(
                                                      "erorr".tr,
                                                      'addcard_erorr'.tr,
                                                    );
                                                  }
                                                },
                                                child: Text(
                                                  "link_card".tr,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.black,
                                                  minimumSize: Size(
                                                    double.infinity,
                                                    50,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            sz(5),
            title('send_pay'.tr),
            sz(5),
            buildlistetile(
              context,
              "send_paypal".tr,
              const Icon(Icons.send),
              const Color(0xffffffff),
              p: () => Send2(id: userid, name: namein),
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
              p: () => Send2(id: userid, name: namein),
            ),
            sz(5),
            title('profile_support'.tr),
            sz(5),
            buildlistetile(
              context,
              "profile".tr,
              const Icon(Icons.portrait_sharp),
              const Color(0xffffffff),
              p: () => Profile(namein: namein, userid: userid),
            ),
            ListTile(
              title: Text("wallet".tr),
              tileColor: const Color(0xffffffff),
              trailing: const Icon(Icons.account_balance_wallet_outlined),
              onTap: () {
                controller.changeIndex(2);
                Get.back();
              },
            ),
            ExpansionTile(
              leading: const Icon(Icons.translate, color: Colors.blue),
              title: const Text("اللغة / Language"),
              children: [
                ListTile(
                  title: const Text("العربية"),
                  trailing: Get.locale?.languageCode == 'ar'
                      ? const Icon(Icons.check, color: Colors.green)
                      : null,
                  onTap: () => Get.updateLocale(const Locale('ar', 'SA')),
                ),
                ListTile(
                  title: const Text("English"),
                  trailing: Get.locale?.languageCode == 'en'
                      ? const Icon(Icons.check, color: Colors.green)
                      : null,
                  onTap: () => Get.updateLocale(const Locale('en', 'US')),
                ),
              ],
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: maincolor,
        // centerTitle: true,
        // title: const Text("PayPal"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Notificationpage(id: userid,)),
              );
            },
            icon: const Icon(
              Icons.notifications_none,
              fill: 0.50,
              color: Colors.blue,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => Profile(namein: namein, userid: userid),
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
        ],
      ),

      body: Obx(
        () =>
            IndexedStack(index: controller.currentIndex.value, children: pages),
      ),

      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          backgroundColor: Color(0xffffffff),
          currentIndex: controller.currentIndex.value,
          onTap: controller.changeIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "home".tr),
            BottomNavigationBarItem(
              icon: Icon(Icons.send),
              label: "send_req".tr,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.wallet),
              label: "wallet".tr,
            ),
          ],
        ),
      ),
    );
  }
}
