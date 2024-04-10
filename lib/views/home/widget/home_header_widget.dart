import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:pocketbook/language/language.dart';
import 'package:pocketbook/utils/app_asset.dart';
import 'package:pocketbook/utils/app_helper.dart';
import 'package:pocketbook/utils/app_style.dart';
import 'package:get/get.dart';

class HomeHeaderWidget extends StatelessWidget {
  final double total;
  final double income;
  final double expense;
  const HomeHeaderWidget({
    super.key,
    required this.total,
    required this.income,
    required this.expense,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).padding.top + 121.0 + 62.0,
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  AppColor.pinkF27781,
                  AppColor.pinkF2A0C6,
                ],
              ),
            ),
            height: MediaQuery.of(context).padding.top + 121.0,
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).padding.top),
                Container(
                  height: 89.0,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// Title
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                LanguageKey.total.tr,
                                textAlign: TextAlign.left,
                                style: TextStyles.mediumTextStyle(
                                  size: 12.0,
                                  color: AppColor.white,
                                ),
                              ),
                            ),

                            /// Value
                            Container(
                              margin: const EdgeInsets.only(top: 9.0),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '\$${AppHelper.formatNumber(total)}',
                                textAlign: TextAlign.left,
                                style: TextStyles.normalTextStyle(
                                  size: 40.0,
                                  color: AppColor.white,
                                ),
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                      ),

                      /// Avatar
                      Container(
                        margin: const EdgeInsets.only(bottom: 25),
                        width: 40.0,
                        height: 40.0,
                        alignment: Alignment.center,
                        child: Image.asset(
                          AppImages.icAvatar,
                          width: 40.0,
                          height: 40.0,
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),

          /// Income/Expense
          Container(
              alignment: Alignment.topCenter,
              height: 94.0,
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 89.0,
                left: 16.0,
                right: 16.0,
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
              )),
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

          /// Value
          Container(
            margin: const EdgeInsets.only(
              top: 9.0,
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
