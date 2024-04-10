import 'package:get/get.dart';
import 'package:pocketbook/language/language.dart';
import 'package:pocketbook/model/responses/category_model.dart';
import 'package:pocketbook/utils/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pocketbook/repos/auth_repo.dart';

class CategoryController extends GetxController {
  AuthRepo authRepo;
  SharedPreferences sharedPreferences;

  CategoryController({
    required this.authRepo,
    required this.sharedPreferences,
  });

  final Rx<String> indicatorSelected = Rx<String>(LanguageKey.expense.tr);
  final Rx<List<CategoryModel>> listCategories = Rx<List<CategoryModel>>([
    CategoryModel(
      name: 'Car',
      type: LanguageKey.expense.tr,
    ),
    CategoryModel(
      name: 'Beauty',
      type: LanguageKey.expense.tr,
    ),
    CategoryModel(
      name: 'Travel',
      type: LanguageKey.expense.tr,
    ),
    CategoryModel(
      name: 'Shopping',
      type: LanguageKey.expense.tr,
    ),
    CategoryModel(
      name: 'Health',
      type: LanguageKey.expense.tr,
    ),
    CategoryModel(
      name: 'Coffee',
      type: LanguageKey.expense.tr,
    ),
    CategoryModel(
      name: 'Restaurant',
      type: LanguageKey.expense.tr,
    ),
    CategoryModel(
      name: 'Income',
      type: LanguageKey.income.tr,
    ),
    CategoryModel(
      name: 'Restaurant Income',
      type: LanguageKey.income.tr,
    )
  ]);

  /// Init
  @override
  void onInit() {
    super.onInit();
  }

  /// Detail Category
  void navigateToDetailCategory(CategoryModel category) {
    Get.toNamed(RoutesName.categoryDetail, arguments: category);
  }

  /// Add Category
  void navigateAddCategory() {
    Get.toNamed(RoutesName.addEditCategory);
  }
}
