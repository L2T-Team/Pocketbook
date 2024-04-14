import 'package:flutter/material.dart';
import 'package:pocketbook/language/language.dart';
import 'package:pocketbook/model/responses/transaction_model.dart';
import 'package:pocketbook/utils/app_constant.dart';
import 'package:pocketbook/utils/app_helper.dart';
import 'package:pocketbook/utils/app_style.dart';
import 'package:get/get.dart';
import 'package:pocketbook/views/report/widget/overview_income_expense_widget.dart';

class OverviewReportMonthWidget extends StatelessWidget {
  final List<TransactionModel> listTrans;
  final DateTime currentDateTime;
  final Function(DateTime) selectDateAction;
  const OverviewReportMonthWidget({
    super.key,
    required this.listTrans,
    required this.currentDateTime,
    required this.selectDateAction,
  });

  @override
  Widget build(BuildContext context) {
    final List<TransactionModel> listFilter = listTrans.where((element) {
      final dateShow = AppHelper.convertStringToDateWithFormat(
        element.date ?? '',
        DateConstant.dateMMddYYYY,
      );
      return dateShow.year == currentDateTime.year &&
          dateShow.month == currentDateTime.month;
    }).toList();
    final List<GroupTransactionModel> listOverrides = [];
    for (int i = 1; i <= AppHelper.daysInMonth(currentDateTime); i++) {
      final filter = listFilter.where((element) {
        final dateShow = AppHelper.convertStringToDateWithFormat(
          element.date ?? '',
          DateConstant.dateMMddYYYY,
        );
        return dateShow.day == i;
      }).toList();
      listOverrides.add(GroupTransactionModel(
        date: '${currentDateTime.month}/$i/${currentDateTime.year}',
        transaction: filter,
      ));
    }
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: AppColor.white,
        border: Border.all(
          width: 1.0,
          color: AppColor.greyECEDF1,
        ),
      ),
      child: Column(
        children: [
          /// Overview
          Container(
            margin: const EdgeInsets.only(bottom: 8.0),
            alignment: Alignment.centerLeft,
            child: Text(
              LanguageKey.overview.tr,
              textAlign: TextAlign.left,
              style: TextStyles.mediumTextStyle(
                size: 14.0,
                color: AppColor.black1C2030.withOpacity(0.5),
              ),
            ),
          ),

          /// List View
          ListView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: listOverrides.length,
            shrinkWrap: true,
            itemBuilder: (conext, indexTr) {
              final override = listOverrides[indexTr];
              final listTransactionIncome = override.transaction
                  .where((element) =>
                      element.category?.type == LanguageKey.income.tr)
                  .toList();
              final listTransactionExpense = override.transaction
                  .where((element) =>
                      element.category?.type == LanguageKey.expense.tr)
                  .toList();
              double amountIncome = 0;
              double amountExpense = 0;
              for (final it in listTransactionIncome) {
                amountIncome += (it.amount ?? 0);
              }
              for (final it in listTransactionExpense) {
                amountExpense += (it.amount ?? 0);
              }
              final date = AppHelper.convertStringToDateWithFormat(
                override.date,
                DateConstant.dateMMddYYYY,
              );
              return SizedBox(
                height: 48.0,
                child: TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: Size.zero,
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {
                    selectDateAction(date);
                  },
                  child: SizedBox(
                    height: 48.0,
                    child: Row(
                      children: [
                        /// Expanded
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              AppHelper.convertDatetoStringWithFormat(
                                  date, DateConstant.dateMMddYYYY),
                              textAlign: TextAlign.left,
                              style: TextStyles.mediumTextStyle(
                                size: 14.0,
                                color: AppColor.black1C2030,
                              ),
                            ),
                          ),
                        ),

                        /// Amount
                        OverviewIncomeExpenseWidget(
                          amountIncome: amountIncome,
                          amountExpense: amountExpense,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
