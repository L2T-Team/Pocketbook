import 'package:get/get.dart';
import 'package:pocketbook/views/home/home_controller.dart';
import 'package:pocketbook/views/kid/kid_controller.dart';
import 'package:pocketbook/views/main/main_view_model.dart';
import 'package:pocketbook/views/report/report_controller.dart';
import 'package:pocketbook/views/setting/setting_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => MainViewModel(),
    );

    Get.lazyPut(
      () => HomeController(
        authRepo: Get.find(),
        sharedPreferences: Get.find(),
      ),
    );

    Get.lazyPut(
      () => ReportController(
        authRepo: Get.find(),
        sharedPreferences: Get.find(),
      ),
    );
    Get.lazyPut(
      () => KidController(
        authRepo: Get.find(),
        sharedPreferences: Get.find(),
      ),
    );
    Get.lazyPut(
      () => SettingController(
        authRepo: Get.find(),
        sharedPreferences: Get.find(),
      ),
    );
  }
}
