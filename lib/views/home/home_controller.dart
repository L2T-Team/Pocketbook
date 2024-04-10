import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketbook/model/responses/category_model.dart';
import 'package:pocketbook/model/responses/transaction_model.dart';
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

  final Rx<double> total = Rx<double>(700000.60);
  final Rx<double> income = Rx<double>(300000.70);
  final Rx<double> expense = Rx<double>(400000.333);
  final Rx<List<TransactionModel>> listTransactions =
      Rx<List<TransactionModel>>([
    TransactionModel(
      id: '1',
      name: 'Lam',
      amount: 5000,
      date: '04/09/2024',
      category: CategoryModel(
        name: 'Beauty',
        type: 'Expense',
      ),
    ),
    TransactionModel(
      id: '2',
      name: 'Le',
      amount: 6000,
      date: '04/10/2024',
      category: CategoryModel(
        name: 'Beauty',
        type: 'Expense',
      ),
    ),
    TransactionModel(
      id: '3',
      name: 'Huu',
      amount: 4000,
      date: '04/08/2024',
      category: CategoryModel(
        name: 'Car',
        type: 'Income',
      ),
    ),
    TransactionModel(
      id: '4',
      name: 'HHH',
      amount: 3300,
      date: '04/10/2024',
      category: CategoryModel(
        name: 'Car',
        type: 'Icome',
      ),
    ),
  ]);

  /// Init
  @override
  void onInit() {
    super.onInit();
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
          deleteAction: () {},
        );
      },
    );
  }
}
