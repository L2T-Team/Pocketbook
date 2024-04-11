import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pocketbook/language/language.dart';
import 'package:pocketbook/model/responses/transaction_model.dart';
import 'package:pocketbook/utils/app_asset.dart';
import 'package:pocketbook/utils/app_constant.dart';
import 'package:pocketbook/utils/app_helper.dart';
import 'package:pocketbook/utils/app_style.dart';
import 'package:get/get.dart';

class ListTransactionWidget extends StatelessWidget {
  final List<TransactionModel> listTrans;
  final Function(TransactionModel) selectedAction;
  final Function(TransactionModel) deleteAction;
  const ListTransactionWidget({
    super.key,
    required this.listTrans,
    required this.selectedAction,
    required this.deleteAction,
  });

  @override
  Widget build(BuildContext context) {
    final List<GroupTransactionModel> listTransactions = [];
    final groupByDate = groupBy(listTrans, (item) => item.date ?? '');
    groupByDate.forEach((date, list) {
      listTransactions.add(
        GroupTransactionModel(
          date: date,
          transaction: list,
        ),
      );
    });
    listTransactions.sort((a, b) {
      final date1 = AppHelper.convertStringToDateWithFormat(
        a.date,
        DateConstant.dateMMddYYYY,
      );
      final date2 = AppHelper.convertStringToDateWithFormat(
        b.date,
        DateConstant.dateMMddYYYY,
      );
      return date2.compareTo(date1);
    });
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: listTransactions.length,
        itemBuilder: (conext, index) {
          final group = listTransactions[index];
          return Column(
            children: [
              /// Date
              Container(
                margin: const EdgeInsets.only(top: 8),
                height: 42.0,
                alignment: Alignment.centerLeft,
                child: Text(
                  AppHelper.checkDateShow(group.date),
                  textAlign: TextAlign.left,
                  style: TextStyles.mediumTextStyle(
                    size: 14.0,
                    color: AppColor.black1C2030,
                  ),
                ),
              ),

              /// Transaction List
              Container(
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
                      itemCount: group.transaction.length,
                      shrinkWrap: true,
                      itemBuilder: (conext, indexTr) {
                        final tran = group.transaction[indexTr];
                        return Slidable(
                          key: ValueKey(index),
                          endActionPane: ActionPane(
                            extentRatio:
                                110.0 / MediaQuery.of(context).size.width,
                            dragDismissible: false,
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (context) {
                                  deleteAction(tran);
                                },
                                backgroundColor: AppColor.redEF4444,
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: LanguageKey.delete.tr,
                              ),
                            ],
                          ),
                          child: SizedBox(
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
                                      margin:
                                          const EdgeInsets.only(right: 16.0),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                            margin:
                                                const EdgeInsets.only(top: 7.0),
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              tran.name ?? '',
                                              textAlign: TextAlign.left,
                                              style: TextStyles.normalTextStyle(
                                                size: 12.0,
                                                color: AppColor.black1C2030
                                                    .withOpacity(0.5),
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
                                      margin: const EdgeInsets.only(right: 3),
                                      child: Text(
                                        '${tran.category?.type == LanguageKey.income.tr ? '+' : '-'}\$${AppHelper.formatNumber(tran.amount ?? 0)}',
                                        textAlign: TextAlign.left,
                                        style: TextStyles.normalTextStyle(
                                          size: 14.0,
                                          color: tran.category?.type ==
                                                  LanguageKey.income.tr
                                              ? AppColor.green10B981
                                              : AppColor.redEF4444,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              /// Botttom Spacing
              SizedBox(
                height: (listTransactions.length - 1) == index ? 24.0 : 0,
              ),
            ],
          );
        },
      ),
    );
  }
}
