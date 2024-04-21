import 'package:get/get.dart';
import 'package:pocketbook/views/setting/detail_category/detail_category_controller.dart';

class DetailCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => DetailCategoryController(
        authRepo: Get.find(),
        sharedPreferences: Get.find(),
      ),
    );
  }
}
