import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paypal_application/Database/DatabaseHelper.dart';
import 'package:paypal_application/controller/wallet_controller.dart';
import 'package:paypal_application/controller/notification_controller.dart';

class SelectSend extends StatelessWidget {
   var id;
   var name;
   var fromid;
   var fromname;

  final db = DatabaseHelper.instance;
  final Color maincolor = const Color.fromARGB(255, 216, 221, 234);

  final TextEditingController amont = TextEditingController();
  final TextEditingController message = TextEditingController();

  SelectSend({
    super.key,
    required this.id,
    required this.name,
    required this.fromid,
    required this.fromname,
  });

  WalletController get walletController => Get.put(WalletController(fromid));

  NotificationController get fromNotificationController =>
      Get.put(NotificationController(fromid));
  NotificationController get toNotificationController =>
      Get.put(NotificationController(id));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincolor,
      appBar: AppBar(
        title: Text("amount".tr),
        centerTitle: true,
        backgroundColor: maincolor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: amont,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                hintText: "0.00",
                prefixIcon: const Icon(Icons.attach_money_outlined, size: 40),
                border: InputBorder.none,
              ),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: message,
              decoration: InputDecoration(
                hintText: "add_message".tr,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: (MediaQuery.of(context).size.width * 0.45),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (amont.text.isNotEmpty) {
                        await toNotificationController.addNotification({
                          'user_id': id,
                          'title': 'طلب تحويل',
                          'body':
                              'تم إرسال طلب تحويل من $fromname بمبلغ ${amont.text}',
                          'is_read': 0,
                          'created_at': DateTime.now().toString(),
                        });
                        await fromNotificationController.addNotification({
                          'user_id': fromid,
                          'title': 'تم إرسال طلب',
                          'body':
                              'تم إرسال طلب تحويل إلى $name بمبلغ ${amont.text}',
                          'is_read': 0,
                          'created_at': DateTime.now().toString(),
                        });
                        Get.snackbar('Success', 'Request sent to $name');
                      } else {
                        Get.snackbar('error'.tr, 'enter_amount'.tr);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text("request".tr),
                  ),
                ),
                SizedBox(
                  width: (MediaQuery.of(context).size.width * 0.45),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (amont.text.isNotEmpty) {
                        double sendAmount = double.parse(amont.text);
                        if (walletController.balance.value >= sendAmount) {
                          await db.adjustBalance(fromid, -sendAmount);
                          await db.adjustBalance(id, sendAmount);
                          await walletController.loadBalance();
                          await toNotificationController.addNotification({
                            'user_id': id,
                            'title': 'تم استلام تحويل',
                            'body':
                                'تم استلام تحويل من $fromname بمبلغ ${amont.text}',
                            'is_read': 0,
                            'created_at': DateTime.now().toString(),
                          });
                          await fromNotificationController.addNotification({
                            'user_id': fromid,
                            'title': 'تم إرسال تحويل',
                            'body':
                                'تم إرسال تحويل إلى $name بمبلغ ${amont.text}',
                            'is_read': 0,
                            'created_at': DateTime.now().toString(),
                          });
                          Get.snackbar('Success'.tr, 'money_sent_success'.tr);
                          Future.delayed(const Duration(milliseconds: 500), () {
                            Get.close(1);
                          });
                        } else {
                          Get.snackbar('error'.tr, 'balance_low'.tr);
                        }
                      } else {
                        Get.snackbar('error'.tr, 'enter_amount'.tr);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text("send".tr),
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
