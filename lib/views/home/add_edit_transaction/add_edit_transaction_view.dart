import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketbook/language/language.dart';
import 'package:pocketbook/model/responses/category_model.dart';
import 'package:pocketbook/utils/app_style.dart';
import 'package:pocketbook/views/home/add_edit_transaction/add_edit_transaction_controller.dart';
import 'package:pocketbook/views/home/add_edit_transaction/widget/amount_text_field_widget.dart';
import 'package:pocketbook/views/home/add_edit_transaction/widget/date_widget.dart';
import 'package:pocketbook/views/home/add_edit_transaction/widget/item_category_widget.dart';
import 'package:pocketbook/views/login/widget/button_widget.dart';
import 'package:pocketbook/views/login/widget/text_field_widget.dart';
import 'package:pocketbook/views/setting/category/widget/category_header_widget.dart';
import 'package:pocketbook/views/setting/widget/header_widget.dart';

class AddEditTransactionView extends GetWidget<AddEditTransactionController> {
  const AddEditTransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            /// Header
            Obx(
              () => HeaderWidget(
                title: controller.transactionDetail.value != null
                    ? LanguageKey.editTransaction.tr
                    : LanguageKey.addNewTransaction.tr,
              ),
            ),

            /// Depense
            Obx(
              () => IgnorePointer(
                ignoring: controller.transactionDetail.value != null,
                child: Opacity(
                  opacity: controller.transactionDetail.value != null ? 0.5 : 1,
                  child: CategoryHeaderWidget(
                    itemSelected: controller.indicatorSelected.value,
                    indicatorSelectedAction: (String selected) {
                      controller.indicatorSelected.value = selected;
                    },
                  ),
                ),
              ),
            ),

            /// Body
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      /// DateTime
                      Obx(
                        () => DateWidget(
                          date: controller.currentDate.value,
                          nextAction: controller.nextDateAction,
                          previousAction: controller.previousDateAction,
                        ),
                      ),

                      /// Amount
                      Obx(
                        () => Container(
                          margin: const EdgeInsets.symmetric(vertical: 24.0),
                          child: AmountTextFieldWidget(
                            titleLabel: LanguageKey.amount.tr,
                            focusNode: controller.focusNodeAmount,
                            controller: controller.controllerAmount,
                            hintText: '',
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            onChange: (String text) {
                              controller.validateButtonAction();
                            },
                            isFocus: controller.isFocusAmount.value,
                          ),
                        ),
                      ),

                      /// Category List
                      Container(
                        margin: const EdgeInsets.only(bottom: 16.0),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          LanguageKey.category.tr,
                          textAlign: TextAlign.left,
                          style: TextStyles.mediumTextStyle(
                            size: 14.0,
                            color: AppColor.black1C2030,
                          ),
                        ),
                      ),
                      Obx(
                        () => ItemCategoryWidget(
                          listCategories: controller.listCategories.value,
                          indicatorSelected: controller.indicatorSelected.value,
                          categorySelectedAction: (CategoryModel category) {
                            controller.categorySelected.value = category;
                          },
                          categorySelected: controller.categorySelected.value,
                          navigateCategory: () {
                            controller.navigateAddCategory();
                          },
                        ),
                      ),

                      /// Name
                      Obx(
                        () => Container(
                          margin: const EdgeInsets.only(top: 30, bottom: 20),
                          child: TextFieldWidget(
                            titleLabel: LanguageKey.name.tr,
                            focusNode: controller.focusNodeName,
                            controller: controller.controllerName,
                            hintText: LanguageKey.username.tr,
                            onChange: (String text) {
                              controller.validateButtonAction();
                            },
                            isFocus: controller.isFocusName.value,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /// Bottom Button
            SafeArea(
              top: false,
              bottom: true,
              child: Obx(
                () => Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 12.0),
                  child: ButtonWidget(
                    title: LanguageKey.save.tr,
                    onTap: () {
                      controller.saveAction();
                    },
                    enable: controller.enableButton.value,
                    isLoading: false,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
