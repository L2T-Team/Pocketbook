import 'package:flutter/material.dart';
import 'package:pocketbook/language/language.dart';
import 'package:pocketbook/model/responses/transaction_model.dart';
import 'package:pocketbook/utils/app_asset.dart';
import 'package:pocketbook/utils/app_constant.dart';
import 'package:pocketbook/utils/app_helper.dart';
import 'package:pocketbook/utils/app_style.dart';
import 'package:get/get.dart';

class OverviewReportDayWidget extends StatelessWidget {
  final List<TransactionModel> listTrans;
  final DateTime currentDateTime;
  final Function(TransactionModel) selectedAction;
  const OverviewReportDayWidget({
    super.key,
    required this.listTrans,
    required this.currentDateTime,
    required this.selectedAction,
  });

  @override
  Widget build(BuildContext context) {
    final List<TransactionModel> listFilter = listTrans.where((element) {
      final dateShow = AppHelper.convertStringToDateWithFormat(
        element.date ?? '',
        DateConstant.dateMMddYYYY,
      );
      return dateShow.year == currentDateTime.year &&
          dateShow.month == currentDateTime.month &&
          dateShow.day == currentDateTime.day;
    }).toList();

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
              LanguageKey.transaction.tr,
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
            itemCount: listFilter.length,
            shrinkWrap: true,
            itemBuilder: (conext, indexTr) {
              final tran = listFilter[indexTr];
              return SizedBox(
                height: 64.0,
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
                    selectedAction(tran);
                  },
                  child: SizedBox(
                    height: 64.0,
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// Category
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  tran.category?.name ?? '',
                                  textAlign: TextAlign.left,
                                  style: TextStyles.mediumTextStyle(
                                    size: 14.0,
                                    color: AppColor.black1C2030,
                                  ),
                                ),
                              ),

                              /// Value
                              Container(
                                margin: const EdgeInsets.only(top: 7.0),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  tran.name ?? '',
                                  textAlign: TextAlign.left,
                                  style: TextStyles.normalTextStyle(
                                    size: 12.0,
                                    color:
                                        AppColor.black1C2030.withOpacity(0.5),
                                  ),
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                        ),

                        /// Amount
                        Container(
                          alignment: Alignment.centerRight,
                          margin: const EdgeInsets.only(right: 0),
                          child: Text(
                            '${tran.category?.type == LanguageKey.income.tr ? '+' : '-'}\$${AppHelper.formatNumber(tran.amount ?? 0)}',
                            textAlign: TextAlign.left,
                            style: TextStyles.normalTextStyle(
                              size: 14.0,
                              color:
                                  tran.category?.type == LanguageKey.income.tr
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
