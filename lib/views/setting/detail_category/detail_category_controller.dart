import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketbook/model/responses/category_model.dart';
import 'package:pocketbook/utils/app_routes.dart';
import 'package:pocketbook/views/setting/detail_category/widget/delete_category_popup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pocketbook/repos/auth_repo.dart';

class DetailCategoryController extends GetxController {
  AuthRepo authRepo;
  SharedPreferences sharedPreferences;

  DetailCategoryController({
    required this.authRepo,
    required this.sharedPreferences,
  });

  final Rxn<CategoryModel> categoryDetail = Rxn<CategoryModel>();

  /// Init
  @override
  void onInit() {
    super.onInit();
    categoryDetail.value = Get.arguments;
  }

  /// Delete Category
  void deleteCategory(BuildContext context, CategoryModel category) {
    showDialog(
      context: context,
      useSafeArea: false,
      builder: (context) {
        return DeleteCategoryPopup(
          deleteAction: () {},
        );
      },
    );
  }

  /// Edit Category
  void navigateEditCategory() {
    Get.toNamed(
      RoutesName.addEditCategory,
      arguments: categoryDetail.value,
    );
  }
}
