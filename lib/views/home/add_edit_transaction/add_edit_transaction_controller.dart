import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketbook/language/language.dart';
import 'package:pocketbook/model/responses/category_model.dart';
import 'package:pocketbook/model/responses/transaction_model.dart';
import 'package:pocketbook/my_app.dart';
import 'package:pocketbook/utils/app_constant.dart';
import 'package:pocketbook/utils/app_helper.dart';
import 'package:pocketbook/utils/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pocketbook/repos/auth_repo.dart';
import 'package:uuid/uuid.dart';

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
  final Rx<List<CategoryModel>> listCategories = Rx<List<CategoryModel>>([]);
  final Rx<DateTime> currentDate = Rx<DateTime>(DateTime.now());
  final FocusNode focusNodeName = FocusNode();
  final TextEditingController controllerName = TextEditingController();
  final Rx<bool> enableButton = Rx<bool>(false);
  final Rx<bool> isFocusName = Rx<bool>(false);
  final Rx<bool> isLoading = Rx<bool>(false);
  final FocusNode focusNodeAmount = FocusNode();
  final TextEditingController controllerAmount = TextEditingController();
  final Rx<bool> isFocusAmount = Rx<bool>(false);
  StreamSubscription? subscription;

  /// Init
  @override
  void onInit() {
    super.onInit();

    /// Handle Value
    if (Get.arguments != null) {
      transactionDetail.value = Get.arguments;
      if (transactionDetail.value!.category != null) {
        categorySelected.value = transactionDetail.value!.category;
        indicatorSelected.value = transactionDetail.value!.category?.type ?? '';
      }
      currentDate.value = AppHelper.convertStringToDateWithFormat(
        transactionDetail.value?.date ?? '',
        DateConstant.dateMMddYYYY,
      );
      controllerName.text = transactionDetail.value?.name ?? '';
      controllerAmount.text =
          (transactionDetail.value?.amount ?? 0).toStringAsFixed(2);
      validateButtonAction();
    }

    /// Another
    focusNodeName.addListener(_onFocusChangeName);
    focusNodeAmount.addListener(_onFocusChangeAmount);

    /// Init Data
    getCategories();
    subscription = eventBus.on().listen((event) {
      if (event == EventConstant.categoryEvent) {
        getCategories();
      }
    });
  }

  /// Dispose
  @override
  void dispose() {
    super.dispose();
    focusNodeName.removeListener(_onFocusChangeName);
    focusNodeName.dispose();
    focusNodeAmount.removeListener(_onFocusChangeAmount);
    focusNodeAmount.dispose();
    subscription?.cancel();
  }

  /// Focus Name
  void _onFocusChangeName() {
    isFocusName.value = focusNodeName.hasFocus;
  }

  void _onFocusChangeAmount() {
    isFocusAmount.value = focusNodeAmount.hasFocus;
  }

  //////////////////////////////////////////////////////////
  /// Get Categories
  //////////////////////////////////////////////////////////
  void getCategories() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      final List<CategoryModel> listCats = [];
      final listFirebase = (await FirebaseFirestore.instance
              .collection(CollectionConstant.user)
              .doc(user?.uid ?? '')
              .collection(CollectionConstant.category)
              .get())
          .docs;

      for (var it in listFirebase) {
        listCats.add(CategoryModel.fromJson(it));
      }

      /// Detail Category
      if (listCats.isNotEmpty && categorySelected.value == null) {
        categorySelected.value = listCats.first;
      }

      /// Add More Category Button
      listCats.add(CategoryModel());

      listCategories.value = listCats;
      validateButtonAction();
    } catch (_) {}
  }

  /// Validate Buttton
  void validateButtonAction() {
    Future.delayed(const Duration(milliseconds: 10)).then((value) {
      enableButton.value = controllerName.text.trim().isNotEmpty &&
          controllerAmount.text.trim().isNotEmpty &&
          categorySelected.value != null;
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

  /// Save Action: Add/Edit
  void saveAction(BuildContext context) async {
    FocusScope.of(context).unfocus();
    isLoading(true);
    try {
      final uuid = transactionDetail.value == null
          ? (const Uuid().v4())
          : (transactionDetail.value?.id ?? '');
      final user = FirebaseAuth.instance.currentUser;
      final TransactionModel request = TransactionModel(
        id: uuid,
        name: controllerName.text,
        amount:
            double.tryParse(controllerAmount.text.replaceAll(',', '.')) ?? 0,
        date: AppHelper.convertDatetoStringWithFormat(
          currentDate.value,
          DateConstant.dateMMddYYYY,
        ),
        category: categorySelected.value,
      );
      if (transactionDetail.value == null) {
        /// Add New
        await FirebaseFirestore.instance
            .collection(CollectionConstant.user)
            .doc(user?.uid ?? '')
            .collection(CollectionConstant.transaction)
            .doc(uuid)
            .set(request.toJson());
      } else {
        /// Edit
        await FirebaseFirestore.instance
            .collection(CollectionConstant.user)
            .doc(user?.uid ?? '')
            .collection(CollectionConstant.transaction)
            .doc(uuid)
            .update(request.toJson());
      }
      eventBus.fire(EventConstant.transactionEvent);
      Get.back();
      isLoading(false);
    } catch (_) {
      isLoading(false);
      AppHelper.showError(LanguageKey.somethingWentWrong.tr);
    }
  }
}
