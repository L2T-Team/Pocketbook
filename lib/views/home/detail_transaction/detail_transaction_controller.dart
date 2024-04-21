import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketbook/model/responses/transaction_model.dart';
import 'package:pocketbook/my_app.dart';
import 'package:pocketbook/utils/app_constant.dart';
import 'package:pocketbook/utils/app_routes.dart';
import 'package:pocketbook/views/home/detail_transaction/widget/delete_transaction_popup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pocketbook/repos/auth_repo.dart';

class DetailTransactionController extends GetxController {
  AuthRepo authRepo;
  SharedPreferences sharedPreferences;

  DetailTransactionController({
    required this.authRepo,
    required this.sharedPreferences,
  });
  StreamSubscription? subscription;
  final Rxn<TransactionModel> transactionDetail = Rxn<TransactionModel>();

  /// Init
  @override
  void onInit() {
    super.onInit();
    transactionDetail.value = Get.arguments;
    subscription = eventBus.on().listen((event) {
      if (event == EventConstant.transactionEvent) {
        getDetailTransaction();
      }
    });
  }

  //////////////////////////////////////////////////////////
  /// Get Detail Transaction
  //////////////////////////////////////////////////////////
  void getDetailTransaction() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      final itemFirebase = (await FirebaseFirestore.instance
          .collection(CollectionConstant.user)
          .doc(user?.uid ?? '')
          .collection(CollectionConstant.transaction)
          .doc(transactionDetail.value?.id ?? '')
          .get());
      transactionDetail.value = TransactionModel.fromJson(itemFirebase);
    } catch (_) {}
  }

  //////////////////////////////////////////////////////////
  /// Delete Detail
  //////////////////////////////////////////////////////////
  void deleteDetailTransaction() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      (await FirebaseFirestore.instance
          .collection(CollectionConstant.user)
          .doc(user?.uid ?? '')
          .collection(CollectionConstant.transaction)
          .doc(transactionDetail.value?.id ?? '')
          .delete());
      eventBus.fire(EventConstant.transactionEvent);
      Get.back();
    } catch (_) {}
  }

  /// Delete Category
  void deleteTransaction(BuildContext context, TransactionModel trans) {
    showDialog(
      context: context,
      useSafeArea: false,
      builder: (context) {
        return DeleteTransactionPopup(
          deleteAction: () {
            deleteDetailTransaction();
          },
        );
      },
    );
  }

  /// Edit Transaction
  void navigateEditTransaction() {
    Get.toNamed(
      RoutesName.addEditTransaction,
      arguments: transactionDetail.value,
    );
  }
}
