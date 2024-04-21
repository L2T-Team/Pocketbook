import 'package:get/get.dart';
import 'package:pocketbook/views/report/report_controller.dart';

class ReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ReportController(
        authRepo: Get.find(),
        sharedPreferences: Get.find(),
      ),
    );
  }
}
