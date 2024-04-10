import 'package:get/get.dart';
import 'package:pocketbook/views/home/detail_transaction/detail_transaction_controller.dart';

class DetailTransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => DetailTransactionController(
        authRepo: Get.find(),
        sharedPreferences: Get.find(),
      ),
    );
  }
}
