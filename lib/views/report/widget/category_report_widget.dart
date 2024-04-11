import 'package:flutter/material.dart';
import 'package:pocketbook/language/language.dart';
import 'package:pocketbook/model/responses/category_model.dart';
import 'package:pocketbook/model/responses/transaction_model.dart';
import 'package:pocketbook/utils/app_asset.dart';
import 'package:pocketbook/utils/app_helper.dart';
import 'package:pocketbook/utils/app_style.dart';
import 'package:get/get.dart';

class CategoryReportWidget extends StatelessWidget {
  final List<CategoryModel> listCategories;
  final List<TransactionModel> listTransactions;
  final Function(CategoryModel) selectedAction;
  const CategoryReportWidget({
    super.key,
    required this.listCategories,
    required this.listTransactions,
    required this.selectedAction,
  });

  @override
  Widget build(BuildContext context) {
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
          /// Transaction
          Container(
            margin: const EdgeInsets.only(bottom: 8.0),
            alignment: Alignment.centerLeft,
            child: Text(
              LanguageKey.category.tr,
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
            itemCount: listCategories.length,
            shrinkWrap: true,
            itemBuilder: (conext, indexTr) {
              final category = listCategories[indexTr];
              final listTransactionCategories = listTransactions
                  .where((element) =>
                      element.category?.name == category.name &&
                      element.category?.type == category.type)
                  .toList();
              double amount = 0;
              for (final it in listTransactionCategories) {
                amount += (it.amount ?? 0);
              }
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
                    selectedAction(category);
                  },
                  child: SizedBox(
                    height: 48.0,
                    child: Row(
                      children: [
                        /// Image
                        Container(
                          margin: const EdgeInsets.only(right: 16.0),
                          width: 40.0,
                          height: 40.0,
                          alignment: Alignment.center,
                          child: Image.asset(
                            AppImages.icAvatar,
                            width: 40.0,
                            height: 40.0,
                            fit: BoxFit.cover,
                          ),
                        ),

                        /// Expanded
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              category.name ?? '',
                              textAlign: TextAlign.left,
                              style: TextStyles.mediumTextStyle(
                                size: 14.0,
                                color: AppColor.black1C2030,
                              ),
                            ),
                          ),
                        ),

                        /// Amount
                        Container(
                          alignment: Alignment.centerRight,
                          margin: const EdgeInsets.only(right: 2),
                          child: Text(
                            '${category.type == LanguageKey.income.tr ? '+' : '-'}\$${AppHelper.formatNumber(amount)}',
                            textAlign: TextAlign.left,
                            style: TextStyles.normalTextStyle(
                              size: 14.0,
                              color: category.type == LanguageKey.income.tr
                                  ? AppColor.green10B981
                                  : AppColor.redEF4444,
                            ),
                          ),
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
