import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketbook/language/language.dart';
import 'package:pocketbook/model/responses/category_model.dart';
import 'package:pocketbook/model/responses/transaction_model.dart';
import 'package:pocketbook/utils/app_style.dart';
import 'package:pocketbook/views/home/add_edit_transaction/widget/date_widget.dart';
import 'package:pocketbook/views/home/widget/income_expense_widget.dart';
import 'package:pocketbook/views/report/report_controller.dart';
import 'package:pocketbook/views/report/widget/category_report_widget.dart';
import 'package:pocketbook/views/report/widget/overview_report_day_widget.dart';
import 'package:pocketbook/views/report/widget/overview_report_month_widget.dart';
import 'package:pocketbook/views/report/widget/overview_report_year_widget.dart';
import 'package:pocketbook/views/report/widget/time_header_widget.dart';
import 'package:pocketbook/views/setting/widget/header_widget.dart';

class ReportView extends GetWidget<ReportController> {
  const ReportView({super.key});

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
            HeaderWidget(
              title: LanguageKey.report.tr,
              isHiddenBack: true,
            ),

            /// Body
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    /// Time Indicator
                    Obx(
                      () => TimeHeaderWidget(
                        itemSelected: controller.selectedTime.value,
                        selectedAction: (String item) {
                          controller.selectedTime.value = item;
                          controller.calculateCategoryTransaction(
                              controller.totalTransactions);
                        },
                      ),
                    ),

                    /// Date Widget
                    Obx(
                      () => DateWidget(
                        type: controller.selectedTime.value,
                        date: controller.currentDate.value,
                        nextAction: controller.nextDateAction,
                        previousAction: controller.previousDateAction,
                        topPadding: 0.0,
                        selectedDateAction: (DateTime date) {
                          controller.currentDate.value = date;
                          controller.calculateCategoryTransaction(
                              controller.totalTransactions);
                        },
                      ),
                    ),

                    /// Expense / Income
                    Obx(
                      () => IncomeExpenseWidget(
                        income: controller.income.value,
                        expense: controller.expense.value,
                        topPadding: 16.0,
                        horizontalPadding: 0.0,
                      ),
                    ),

                    /// List Body
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            /// Category
                            Container(
                              margin: const EdgeInsets.only(top: 16),
                              child: Obx(
                                () => CategoryReportWidget(
                                  listCategories:
                                      controller.listCategories.value,
                                  listTransactions:
                                      controller.listTransactions.value,
                                  selectedAction: (CategoryModel category) {},
                                ),
                              ),
                            ),

                            /// Overview / Trasaction
                            Container(
                              margin: const EdgeInsets.only(top: 16),
                              child: Obx(
                                () => controller.selectedTime.value ==
                                        LanguageKey.year.tr
                                    ? OverviewReportYearWidget(
                                        listTrans:
                                            controller.listTransactions.value,
                                        currentDateTime:
                                            controller.currentDate.value,
                                        selectDateAction: (DateTime date) {
                                          /// Selected Month
                                              controller.currentDate.value =
                                                  date;
                                              controller.selectedTime.value =
                                                  LanguageKey.month.tr;
                                              controller
                                                  .calculateCategoryTransaction(
                                                      controller
                                                          .totalTransactions);
                                        },
                                      )
                                    : (controller.selectedTime.value ==
                                            LanguageKey.month.tr
                                        ? OverviewReportMonthWidget(
                                            listTrans: controller
                                                .listTransactions.value,
                                            currentDateTime:
                                                controller.currentDate.value,
                                            selectDateAction: (DateTime date) {
                                              /// Selected Day
                                              controller.currentDate.value =
                                                  date;
                                              controller.selectedTime.value =
                                                  LanguageKey.day.tr;
                                              controller
                                                  .calculateCategoryTransaction(
                                                      controller
                                                          .totalTransactions);
                                            },
                                          )
                                        : OverviewReportDayWidget(
                                            listTrans: controller
                                                .listTransactions.value,
                                            currentDateTime:
                                                controller.currentDate.value,
                                            selectedAction: (TransactionModel
                                                transaction) {},
                                          )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
