import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:untitled2/home.dart';
import 'package:untitled2/send/send.dart';
import 'package:untitled2/profile/profile.dart';
import 'package:untitled2/page.dart';
import 'package:get/get.dart';
import 'package:untitled2/send/send2.dart';

String s = "";
Color cs = Colors.white;

//جبران سليمان احمد
class Send extends StatelessWidget {
  String namein="";
  Send({required this.namein});

  Color c = Colors.red;

  Container buildlistetile(context, txt, Icon i, Color co, {Function? p}) {
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
          Get.to(p!());
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
            const Center(child: Text('القائمة')),
            sz(10),
            title('ادارة الاستثمارات'),
            sz(5),
            buildlistetile(
              context,
              "تفضيلات الدفع",
              const Icon(Icons.favorite),
              const Color(0xffffffff),
              p: () => Page1(),
            ),
            buildlistetile(
              context,
              "اضافة حسابات بنكية وبطاقات",
              const Icon(Icons.add),
              const Color(0xffffffff),
            ),
            sz(5),
            title('ارسال ودفع'),
            sz(5),
            buildlistetile(
              context,
              "ارسال الى حساب على PayPal",
              const Icon(Icons.send),
              const Color(0xffffffff),
            ),
            buildlistetile(
              context,
              "سداد فواتير",
              const Icon(Icons.payment),
              const Color(0xffffffff),
            ),
            sz(5),
            title('تلقي مدفوعات'),
            sz(5),
            buildlistetile(
              context,
              "طلب أموال",
              const Icon(Icons.request_page),
              const Color(0xffffffff),
            ),
            sz(5),
            title('الملف الشخصي والدعم'),
            sz(5),
            buildlistetile(
              context,
              "ملفك الشخصي",
              const Icon(Icons.portrait_sharp),
              const Color(0xffffffff),
            ),
            buildlistetile(
              context,
              "محفظتك",
              const Icon(Icons.account_balance_wallet_outlined),
              const Color(0xffffffff),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: maincolor,
        leading: IconButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Profile(namein: namein)),
              (route) => true,
            );
          },
          icon: const Icon(
            Icons.person_outline_sharp,
            fill: 0.50,
            color: Colors.blue,
          ),
        ),
      ),
      body: ListView(
        children: [
          sz(20),
          Text(
            "ارسال وطلب ",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          InkWell(
            onTap: () => Get.to(Send2()),
            child: Container(
              height: 50,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                textDirection: TextDirection.rtl,
                children: [
                  SizedBox(width: 10),
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 10),
                  Text(
                    "ابحث و@اسم المستخدم والبريد الكتروني ورقم المحمول",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
            ),
          ),
          sz(20),
          Center(
            child: Text(
              "ارسل الى او اطلب من اي شخص تقريباً,ومن اي\nمكان",
              style: TextStyle(fontSize: 22),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
            ),
          ),
          sz(10),
          Center(
            child: Text(
              "ارسل او اطلب عبر البريد الالكتروني او المحمول, او ابحث في\n مستخدمي PayPal بالاسم",
              style: TextStyle(fontSize: 16),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
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
