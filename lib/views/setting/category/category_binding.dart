import 'package:get/get.dart';
import 'package:pocketbook/views/setting/category/category_controller.dart';

class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => CategoryController(
        authRepo: Get.find(),
        sharedPreferences: Get.find(),
      ),
    );
  }
}
