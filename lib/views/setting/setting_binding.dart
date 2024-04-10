import 'package:get/get.dart';
import 'package:pocketbook/views/setting/setting_controller.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SettingController(
        authRepo: Get.find(),
        sharedPreferences: Get.find(),
      ),
    );
  }
}
