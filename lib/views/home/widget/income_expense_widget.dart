import 'package:flutter/material.dart';
import 'package:pocketbook/language/language.dart';
import 'package:pocketbook/utils/app_asset.dart';
import 'package:pocketbook/utils/app_helper.dart';
import 'package:pocketbook/utils/app_style.dart';
import 'package:get/get.dart';

class IncomeExpenseWidget extends StatelessWidget {
  final double? topPadding;
  final double? horizontalPadding;
  final double income;
  final double expense;

  const IncomeExpenseWidget({
    super.key,
    this.topPadding,
    this.horizontalPadding,
    required this.income,
    required this.expense,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      height: 94.0,
      margin: EdgeInsets.only(
        top: topPadding ?? (MediaQuery.of(context).padding.top + 89.0),
        left: horizontalPadding ?? 16.0,
        right: horizontalPadding ?? 16.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
        color: AppColor.white,
        border: Border.all(
          width: 1.0,
          color: AppColor.greyECEDF1,
        ),
      ),
      child: Row(
        children: [
          /// Income
          _buildIncomeExpense(
            AppImages.icUp,
            LanguageKey.income.tr,
            income,
            AppColor.green10B981,
          ),

          /// Line Center
          Container(
            width: 1.0,
            height: 46.0,
            color: AppColor.greyC5C8D4,
            alignment: Alignment.center,
          ),

          /// Expense
          _buildIncomeExpense(
            AppImages.icDown,
            LanguageKey.expense.tr,
            expense,
            AppColor.redEF4444,
          ),
        ],
      ),
    );
  }

  /// Incom/Expense
  Widget _buildIncomeExpense(
    String icon,
    String title,
    double value,
    Color color,
  ) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// Title
          Container(
            alignment: Alignment.center,
            child: Opacity(
              opacity: 0.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// Icon
                  Container(
                    height: 16.0,
                    width: 16.0,
                    alignment: Alignment.center,
                    child: Image.asset(
                      icon,
                      height: 16.0,
                      width: 16.0,
                      fit: BoxFit.cover,
                    ),
                  ),

                  /// Title
                  Container(
                    margin: const EdgeInsets.only(left: 8.0),
                    alignment: Alignment.center,
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyles.mediumTextStyle(
                        size: 14.0,
                        color: AppColor.black1C2030,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// Value
          Container(
            margin: const EdgeInsets.only(
              top: 10.0,
              left: 3.0,
              right: 3.0,
            ),
            alignment: Alignment.center,
            child: Text(
              '\$${AppHelper.formatNumber(value)}',
              textAlign: TextAlign.center,
              style: TextStyles.mediumTextStyle(
                size: 20.0,
                color: color,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
