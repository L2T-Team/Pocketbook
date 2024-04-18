import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketbook/language/language.dart';
import 'package:pocketbook/model/responses/transaction_model.dart';
import 'package:pocketbook/model/responses/user_model.dart';
import 'package:pocketbook/my_app.dart';
import 'package:pocketbook/utils/app_constant.dart';
import 'package:pocketbook/utils/app_helper.dart';
import 'package:pocketbook/utils/app_routes.dart';
import 'package:pocketbook/views/home/detail_transaction/widget/delete_transaction_popup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pocketbook/repos/auth_repo.dart';

class HomeController extends GetxController {
  AuthRepo authRepo;
  SharedPreferences sharedPreferences;

  HomeController({
    required this.authRepo,
    required this.sharedPreferences,
  });

  final Rx<double> total = Rx<double>(0);
  final Rx<double> income = Rx<double>(0);
  final Rx<double> expense = Rx<double>(0);
  final Rx<List<TransactionModel>> listTransactions =
      Rx<List<TransactionModel>>([]);
  StreamSubscription? subscription;
  final Rx<String> avatarUrl = Rx<String>('');

  /// Init
  @override
  void onInit() {
    super.onInit();
    getTransactions();
    getAvatar();
    subscription = eventBus.on().listen((event) {
      if (event == EventConstant.transactionEvent) {
        getTransactions();
      } else if (event == EventConstant.updateAvatarEvent) {
        getAvatar();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    subscription?.cancel();
  }

  //////////////////////////////////////////////////////////
  /// Get Avatar
  //////////////////////////////////////////////////////////
  void getAvatar() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      final itemFirebase = (await FirebaseFirestore.instance
          .collection(CollectionConstant.user)
          .doc(user?.uid ?? '')
          .collection(CollectionConstant.avatar)
          .doc(user?.uid ?? '')
          .get());
      final AvatarModel avatarF = AvatarModel.fromJson(itemFirebase);
      if ((avatarF.avatar ?? '').isNotEmpty) {
        avatarUrl.value = avatarF.avatar ?? '';
      }
    } catch (_) {}
  }

  //////////////////////////////////////////////////////////
  /// Get Trasaction
  //////////////////////////////////////////////////////////
  void getTransactions() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      List<TransactionModel> listTrans = [];
      final listFirebase = (await FirebaseFirestore.instance
              .collection(CollectionConstant.user)
              .doc(user?.uid ?? '')
              .collection(CollectionConstant.transaction)
              .get())
          .docs;

      for (var it in listFirebase) {
        listTrans.add(TransactionModel.fromJson(it));
      }

      /// Same Month Condition
      listTrans = listTrans.where((element) {
        final dateShow = AppHelper.convertStringToDateWithFormat(
          element.date ?? '',
          DateConstant.dateMMddYYYY,
        );
        return AppHelper.checkTheSameMonth(dateShow, DateTime.now());
      }).toList();

      /// Apply List
      listTransactions.value = listTrans;

      /// Amount
      double incomeValue = 0;
      double expenseValue = 0;
      final filterIncome = listTrans
          .where((element) => element.category?.type == LanguageKey.income.tr)
          .toList();
      final filterExpense = listTrans
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
      total.value = income.value - expense.value;
    } catch (_) {}
  }

  //////////////////////////////////////////////////////////
  /// Delete Detail
  //////////////////////////////////////////////////////////
  void deleteDetailTransaction(TransactionModel trans) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      (await FirebaseFirestore.instance
          .collection(CollectionConstant.user)
          .doc(user?.uid ?? '')
          .collection(CollectionConstant.transaction)
          .doc(trans.id ?? '')
          .delete());
      eventBus.fire(EventConstant.transactionEvent);
      Get.back();
    } catch (_) {}
  }

  /// Navigate Detail Transaction
  void navigateDetailTransaction(TransactionModel tran) {
    Get.toNamed(RoutesName.transactionDetail, arguments: tran);
  }

  /// Delete Transaction
  void deleteTransaction(
    BuildContext context,
    TransactionModel trans,
  ) {
    showDialog(
      context: context,
      useSafeArea: false,
      builder: (context) {
        return DeleteTransactionPopup(
          deleteAction: () {
            deleteDetailTransaction(trans);
          },
        );
      },
    );
  }
}
