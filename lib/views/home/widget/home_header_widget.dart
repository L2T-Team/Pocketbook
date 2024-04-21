import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pocketbook/language/language.dart';
import 'package:pocketbook/my_app.dart';
import 'package:pocketbook/utils/app_asset.dart';
import 'package:pocketbook/utils/app_constant.dart';
import 'package:pocketbook/utils/app_helper.dart';
import 'package:pocketbook/utils/app_style.dart';
import 'package:get/get.dart';
import 'package:pocketbook/views/home/widget/income_expense_widget.dart';

class HomeHeaderWidget extends StatelessWidget {
  final double total;
  final double income;
  final double expense;
  final String avatarUrl;
  const HomeHeaderWidget({
    super.key,
    required this.total,
    required this.income,
    required this.expense,
    required this.avatarUrl,
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
                                '${total < 0 ? '-' : ''}\$${AppHelper.formatNumber(total)}',
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
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: AppColor.grey1E2A3B,
                        ),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: EdgeInsets.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          onPressed: () {
                            eventBus.fire(EventConstant.navigateMeEvent);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: (avatarUrl).isNotEmpty
                                ? CachedNetworkImage(
                                    imageUrl: (avatarUrl),
                                    width: 40.0,
                                    height: 40.0,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) =>
                                        SpinKitCircle(
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                  )
                                : Image.asset(
                                    AppImages.icAvatar,
                                    width: 40.0,
                                    height: 40.0,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          /// Income/Expense
          IncomeExpenseWidget(
            income: income,
            expense: expense,
          ),
        ],
      ),
    );
  }
}
