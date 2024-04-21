import 'package:get/get.dart';
import 'package:pocketbook/views/kid/kid_controller.dart';

class KidBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => KidController(
        authRepo: Get.find(),
        sharedPreferences: Get.find(),
      ),
    );
  }
}
