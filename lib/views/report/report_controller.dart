import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pocketbook/language/language.dart';
import 'package:pocketbook/model/responses/category_model.dart';
import 'package:pocketbook/model/responses/transaction_model.dart';
import 'package:pocketbook/my_app.dart';
import 'package:pocketbook/utils/app_constant.dart';
import 'package:pocketbook/utils/app_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pocketbook/repos/auth_repo.dart';

class ReportController extends GetxController {
  AuthRepo authRepo;
  SharedPreferences sharedPreferences;

  ReportController({
    required this.authRepo,
    required this.sharedPreferences,
  });

  final Rx<String> selectedTime = Rx<String>(LanguageKey.day.tr);
  final Rx<DateTime> currentDate = Rx<DateTime>(DateTime.now());
  final Rx<double> income = Rx<double>(0.0);
  final Rx<double> expense = Rx<double>(0.0);
  final Rx<List<CategoryModel>> listCategories = Rx<List<CategoryModel>>([]);
  final Rx<List<TransactionModel>> listTransactions =
      Rx<List<TransactionModel>>([]);
  List<TransactionModel> totalTransactions = [];

  StreamSubscription? subscription;

  /// Init
  @override
  void onInit() {
    super.onInit();
    getTransactions();
    subscription = eventBus.on().listen((event) {
      if (event == EventConstant.transactionEvent) {
        getTransactions();
      }
    });
  }

  /// Dispose
  @override
  void dispose() {
    super.dispose();
    subscription?.cancel();
  }

  //////////////////////////////////////////////////////////
  /// Get Trasaction
  //////////////////////////////////////////////////////////
  void getTransactions() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      final List<TransactionModel> listTrans = [];
      final listFirebase = (await FirebaseFirestore.instance
              .collection(CollectionConstant.user)
              .doc(user?.uid ?? '')
              .collection(CollectionConstant.transaction)
              .get())
          .docs;

      for (var it in listFirebase) {
        listTrans.add(TransactionModel.fromJson(it));
      }
      totalTransactions = listTrans;
      calculateCategoryTransaction(listTrans);
    } catch (_) {}
  }

  /// Calculate Category Transaction
  void calculateCategoryTransaction(List<TransactionModel> listTrans) {
    /// Amount
    double incomeValue = 0;
    double expenseValue = 0;

    /// CONDITION
    final listFilter = listTrans.where((element) {
      final dateShow = AppHelper.convertStringToDateWithFormat(
        element.date ?? '',
        DateConstant.dateMMddYYYY,
      );

      if (selectedTime.value == LanguageKey.day.tr ||
          selectedTime.value == LanguageKey.period.tr) {
        /// DAY / PERIOD TYPE
        return AppHelper.checkTheSameDate(dateShow, currentDate.value);
      } else if (selectedTime.value == LanguageKey.month.tr) {
        /// MONTH TYPE
        return AppHelper.checkTheSameMonth(dateShow, currentDate.value);
      } else if (selectedTime.value == LanguageKey.year.tr) {
        /// YEAR TYPE
        return dateShow.year == currentDate.value.year;
      }
      return AppHelper.checkTheSameDate(dateShow, currentDate.value);
    }).toList();
    // Amount
    final filterIncome = listFilter
        .where((element) => element.category?.type == LanguageKey.income.tr)
        .toList();
    final filterExpense = listFilter
        .where((element) => element.category?.type == LanguageKey.expense.tr)
        .toList();
    for (final item in filterIncome) {
      incomeValue += (item.amount ?? 0);
    }
    for (final item in filterExpense) {
      expenseValue += (item.amount ?? 0);
    }
    income.value = incomeValue;
    expense.value = expenseValue;
    // Transaction
    listTransactions.value = listFilter;
    // Category
    List<CategoryModel> listCats = [];
    final groupByCategory = groupBy(listFilter, (item) => item.category);
    groupByCategory.forEach((category, list) {
      category?.listTrans = list;
      listCats.add(category!);
    });
    listCategories.value = listCats;
  }

  /// Next Date
  void nextDateAction() {
    if (selectedTime.value == LanguageKey.day.tr) {
      currentDate.value = currentDate.value.add(const Duration(days: 1));
    } else if (selectedTime.value == LanguageKey.month.tr) {
      currentDate.value = currentDate.value.add(const Duration(days: 30));
    } else if (selectedTime.value == LanguageKey.year.tr) {
      currentDate.value = currentDate.value.add(const Duration(days: 365));
    }
    calculateCategoryTransaction(totalTransactions);
  }

  /// Previous Date
  void previousDateAction() {
    if (selectedTime.value == LanguageKey.day.tr) {
      currentDate.value = currentDate.value.subtract(const Duration(days: 1));
    } else if (selectedTime.value == LanguageKey.month.tr) {
      currentDate.value = currentDate.value.subtract(const Duration(days: 30));
    } else if (selectedTime.value == LanguageKey.year.tr) {
      currentDate.value = currentDate.value.subtract(const Duration(days: 365));
    }
    calculateCategoryTransaction(totalTransactions);
  }
}
