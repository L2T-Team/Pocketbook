import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketbook/model/responses/transaction_model.dart';
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

  final Rxn<TransactionModel> transactionDetail = Rxn<TransactionModel>();

  /// Init
  @override
  void onInit() {
    super.onInit();
    transactionDetail.value = Get.arguments;
  }

  /// Delete Category
  void deleteTransaction(BuildContext context, TransactionModel trans) {
    showDialog(
      context: context,
      useSafeArea: false,
      builder: (context) {
        return DeleteTransactionPopup(
          deleteAction: () {},
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
