import 'package:get/get.dart';
import 'package:pocketbook/views/setting/add_edit_category/add_edit_category_controller.dart';

class AddEditCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AddEditCategoryController(
        authRepo: Get.find(),
        sharedPreferences: Get.find(),
      ),
    );
  }
}
