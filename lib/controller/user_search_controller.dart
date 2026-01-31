import 'package:get/get.dart';
import 'package:paypal_application/Database/databasehelper.dart';

class UserSearchController extends GetxController {
  final RxList<Map<String, dynamic>> results = <Map<String, dynamic>>[].obs;
  final db = DatabaseHelper.instance;

  void searchUsers(String query) async {
    if (query.isEmpty) {
      results.clear();
      return;
    }
    final dbInstance = await db.database;
    final res = await dbInstance.query(
      'users',
      where: 'name LIKE ? OR email LIKE ?',
      whereArgs: ['%$query%', '%$query%'],
    );
    results.assignAll(res);
  }
}
