import 'package:get/get.dart';
import 'package:pocketbook/views/home/add_edit_transaction/add_edit_transaction_controller.dart';

class AddEditTransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AddEditTransactionController(
        authRepo: Get.find(),
        sharedPreferences: Get.find(),
      ),
    );
  }
}
