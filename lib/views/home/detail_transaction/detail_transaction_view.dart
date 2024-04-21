import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketbook/language/language.dart';
import 'package:pocketbook/utils/app_helper.dart';
import 'package:pocketbook/utils/app_style.dart';
import 'package:pocketbook/views/home/detail_transaction/detail_transaction_controller.dart';
import 'package:pocketbook/views/login/widget/button_widget.dart';
import 'package:pocketbook/views/setting/detail_category/widget/delete_button_widget.dart';
import 'package:pocketbook/views/setting/widget/header_widget.dart';

class DetailTransactionView extends GetWidget<DetailTransactionController> {
  const DetailTransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            /// Header
            HeaderWidget(title: LanguageKey.transactionDetail.tr),

            /// Body
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 16.0,
                ),
                child: Obx(() => Column(
                      children: [
                        /// Amount
                        Container(
                          alignment: Alignment.topCenter,
                          child: Text(
                            LanguageKey.amount.tr,
                            textAlign: TextAlign.center,
                            style: TextStyles.mediumTextStyle(
                              size: 12.0,
                              color: AppColor.black1C2030.withOpacity(0.5),
                            ),
                          ),
                        ),

                        Container(
                          alignment: Alignment.topCenter,
                          margin: const EdgeInsets.only(
                            top: 8.0,
                            left: 10.0,
                            right: 20.0,
                          ),
                          child: Text(
                            '\$${AppHelper.formatNumber((controller.transactionDetail.value?.amount ?? 0))}',
                            textAlign: TextAlign.center,
                            style: TextStyles.mediumTextStyle(
                              size: 40.0,
                              color: AppColor.black1C2030,
                            ),
                          ),
                        ),

                        /// Type
                        _buildItemLabel(
                          LanguageKey.type.tr,
                          controller.transactionDetail.value?.category?.type ??
                              '',
                        ),

                        /// Date
                        _buildItemLabel(
                          LanguageKey.date.tr,
                          controller.transactionDetail.value?.date ?? '',
                        ),

                        /// Category
                        _buildItemLabel(
                          LanguageKey.category.tr,
                          controller.transactionDetail.value?.category?.name ??
                              '',
                        ),

                        /// Name
                        _buildItemLabel(
                          LanguageKey.name.tr,
                          controller.transactionDetail.value?.name ?? '',
                        ),
                      ],
                    )),
              ),
            ),

            /// Delete Button
            Container(
              margin: const EdgeInsets.symmetric(vertical: 4.0),
              child: DeleteButtonWidget(
                onTapDelete: () {
                  controller.deleteTransaction(
                    context,
                    controller.transactionDetail.value!,
                  );
                },
              ),
            ),

            /// Bottom Button
            SafeArea(
              top: false,
              bottom: true,
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
                child: ButtonWidget(
                  title: LanguageKey.edit.tr,
                  onTap: () {
                    controller.navigateEditTransaction();
                  },
                  enable: true,
                  isLoading: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Item
  Widget _buildItemLabel(String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(top: 24.0),
      child: Column(
        children: [
          /// Title
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              textAlign: TextAlign.left,
              style: TextStyles.mediumTextStyle(
                size: 14.0,
                color: AppColor.black1C2030,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),

          ///Sub Title
          Container(
            margin: const EdgeInsets.only(top: 9),
            alignment: Alignment.centerLeft,
            child: Text(
              subtitle,
              textAlign: TextAlign.left,
              style: TextStyles.normalTextStyle(
                size: 14.0,
                color: AppColor.grey434D73,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
