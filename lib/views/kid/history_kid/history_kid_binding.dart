import 'package:get/get.dart';
import 'package:pocketbook/views/kid/history_kid/history_kid_controller.dart';

class HistoryKidBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HistoryKidController(
        authRepo: Get.find(),
        sharedPreferences: Get.find(),
      ),
    );
  }
}
