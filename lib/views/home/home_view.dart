import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketbook/model/responses/transaction_model.dart';
import 'package:pocketbook/utils/app_style.dart';
import 'package:pocketbook/views/home/home_controller.dart';
import 'package:pocketbook/views/home/widget/home_header_widget.dart';
import 'package:pocketbook/views/home/widget/list_transaction_widget.dart';

class HomeView extends GetWidget<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.greyFEF6FA,
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            children: [
              /// Header
              Obx(
                () => HomeHeaderWidget(
                  total: controller.total.value,
                  income: controller.income.value,
                  expense: controller.expense.value,
                ),
              ),

              /// Body
              Expanded(
                child: Obx(
                  () => ListTransactionWidget(
                    listTrans: controller.listTransactions.value,
                    selectedAction: (TransactionModel trans) {
                      controller.navigateDetailTransaction(trans);
                    },
                    deleteAction: (TransactionModel trans) {
                      controller.deleteTransaction(context, trans);
                    },
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
