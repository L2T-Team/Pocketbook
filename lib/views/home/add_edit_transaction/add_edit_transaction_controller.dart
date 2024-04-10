import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketbook/language/language.dart';
import 'package:pocketbook/model/responses/category_model.dart';
import 'package:pocketbook/model/responses/transaction_model.dart';
import 'package:pocketbook/utils/app_helper.dart';
import 'package:pocketbook/utils/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pocketbook/repos/auth_repo.dart';

class AddEditTransactionController extends GetxController {
  AuthRepo authRepo;
  SharedPreferences sharedPreferences;

  AddEditTransactionController({
    required this.authRepo,
    required this.sharedPreferences,
  });

  final Rxn<TransactionModel> transactionDetail = Rxn<TransactionModel>();
  final Rx<String> indicatorSelected = Rx<String>(LanguageKey.expense.tr);
  final Rxn<CategoryModel> categorySelected = Rxn<CategoryModel>();
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
  final Rx<DateTime> currentDate = Rx<DateTime>(DateTime.now());
  final FocusNode focusNodeName = FocusNode();
  final TextEditingController controllerName = TextEditingController();
  final Rx<bool> enableButton = Rx<bool>(false);
  final Rx<bool> isFocusName = Rx<bool>(false);
  final FocusNode focusNodeAmount = FocusNode();
  final TextEditingController controllerAmount = TextEditingController();
  final Rx<bool> isFocusAmount = Rx<bool>(false);

  /// Init
  @override
  void onInit() {
    super.onInit();

    /// Handle Value
    if (Get.arguments != null) {
      transactionDetail.value = Get.arguments;
      categorySelected.value = (transactionDetail.value?.category != null)
          ? transactionDetail.value!.category!
          : listCategories.value.first;
      controllerName.text = transactionDetail.value?.name ?? '';
      controllerAmount.text =
          AppHelper.formatNumber(transactionDetail.value?.amount ?? 0);
      validateButtonAction();
    } else {
      categorySelected.value = listCategories.value.first;
    }

    /// Add More Category
    listCategories.update((val) {
      val?.add(CategoryModel());
    });

    /// Another
    focusNodeName.addListener(_onFocusChangeName);
  }

  @override
  void dispose() {
    super.dispose();
    focusNodeName.removeListener(_onFocusChangeName);
    focusNodeName.dispose();
  }

  void _onFocusChangeName() {
    isFocusName.value = focusNodeName.hasFocus;
  }

  /// Validate Buttton
  void validateButtonAction() {
    Future.delayed(const Duration(milliseconds: 10)).then((value) {
      enableButton.value = controllerName.text.trim().isNotEmpty &&
          controllerAmount.text.trim().isNotEmpty;
    });
  }

  /// Next Date
  void nextDateAction() {
    currentDate.value = currentDate.value.add(const Duration(days: 1));
  }

  /// Previous Date
  void previousDateAction() {
    currentDate.value = currentDate.value.subtract(const Duration(days: 1));
  }

  /// Add Category
  void navigateAddCategory() {
    Get.toNamed(RoutesName.addEditCategory);
  }

  /// Save Action
  void saveAction() {}
}
