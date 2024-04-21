import 'package:get/get.dart';
import 'package:pocketbook/views/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(
        authRepo: Get.find(),
        sharedPreferences: Get.find(),
      ),
    );
  }
}
