import 'package:get/get.dart';
import 'package:paypal_application/Database/databasehelper.dart';

class WalletController extends GetxController {
  RxDouble balance = 0.0.obs;
  final int userId;
  final db = DatabaseHelper.instance;

  WalletController(this.userId);

  @override
  void onInit() {
    super.onInit();
    loadBalance();
  }

  Future<void> loadBalance() async {
    final wallet = await db.getWallet(userId);
    balance.value = wallet != null ? (wallet['balance'] ?? 0.00) : 0.00;
  }
}
