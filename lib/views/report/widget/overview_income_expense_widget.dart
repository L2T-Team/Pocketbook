import 'package:flutter/material.dart';
import 'package:pocketbook/utils/app_asset.dart';
import 'package:pocketbook/utils/app_helper.dart';
import 'package:pocketbook/utils/app_style.dart';

class OverviewIncomeExpenseWidget extends StatelessWidget {
  final double amountIncome;
  final double amountExpense;
  const OverviewIncomeExpenseWidget({
    super.key,
    required this.amountIncome,
    required this.amountExpense,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Amount Income
        Container(
          alignment: Alignment.centerRight,
          margin: const EdgeInsets.only(right: 4),
          child: _buildItemIncomeExpend(true, amountIncome),
        ),

        /// Amount Expense
        Container(
          alignment: Alignment.centerRight,
          child: _buildItemIncomeExpend(false, amountExpense),
        ),
      ],
    );
  }

  Widget _buildItemIncomeExpend(bool isIncome, double value) {
    return Container(
      height: 24.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: isIncome ? AppColor.greenE7F8F2 : AppColor.redFDECEC,
      ),
      child: Row(
        children: [
          /// Icon
          Container(
            margin: const EdgeInsets.only(right: 8.0),
            width: 16.0,
            height: 16.0,
            alignment: Alignment.center,
            child: Image.asset(
              isIncome ? AppImages.icUpTrend : AppImages.icDownTrend,
              width: 16.0,
              height: 16.0,
            ),
          ),

          /// Text
          Text(
            '${isIncome ? '+' : '-'}\$${AppHelper.formatNumber(value)}',
            textAlign: TextAlign.left,
            style: TextStyles.normalTextStyle(
              size: 12.0,
              color: isIncome ? AppColor.green10B981 : AppColor.redEF4444,
            ),
          ),
        ],
      ),
    );
  }
}
