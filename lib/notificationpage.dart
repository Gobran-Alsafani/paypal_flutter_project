import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paypal_application/controller/notification_controller.dart';

// ignore: must_be_immutable
class Notificationpage extends StatelessWidget {
  var id;
  Notificationpage({super.key, required this.id});

  // final NotificationController notificationController = Get.put(
  //   NotificationController(0),
  //   permanent: false,
  // );

  @override
  Widget build(BuildContext context) {
    final NotificationController notificationController = Get.put(
      NotificationController(id),
    );
    return Scaffold(
      appBar: AppBar(title: Text("notifications".tr), centerTitle: true),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Obx(() {
          if (notificationController.notifications.isEmpty) {
            return Center(
              child: Text(
                "no_notifications".tr,
                style: TextStyle(fontSize: 20),
              ),
            );
          }
          return ListView.builder(
            itemCount: notificationController.notifications.length,
            itemBuilder: (context, index) {
              final notif = notificationController.notifications[index];
              return ListTile(
                title: Text(notif['title'] ?? ''),
                subtitle: Text(notif['body'] ?? ''),
                trailing: notif['is_read'] == 1
                    ? Icon(Icons.done, color: Colors.green)
                    : null,
              );
            },
          );
        }),
      ),
    );
  }
}
