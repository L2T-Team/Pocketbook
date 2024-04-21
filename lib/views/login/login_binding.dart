import 'package:get/get.dart';
import 'package:pocketbook/views/login/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => LoginController(
        authRepo: Get.find(),
        sharedPreferences: Get.find(),
      ),
    );
  }
}
