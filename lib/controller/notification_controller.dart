import 'package:get/get.dart';
import 'package:paypal_application/Database/databasehelper.dart';

class NotificationController extends GetxController {
  var userId;
  final db = DatabaseHelper.instance;
  RxList<Map<String, dynamic>> notifications = <Map<String, dynamic>>[].obs;

  NotificationController(this.userId);

  @override
  void onInit() {
    super.onInit();
    loadNotifications();
  }

  Future<void> loadNotifications() async {
    var data = await db.getNotifications(userId);
    notifications.assignAll(data);
  }

  Future<void> addNotification(Map<String, dynamic> notification) async {
    await db.insertNotification(notification);
    await loadNotifications();
  }
}
