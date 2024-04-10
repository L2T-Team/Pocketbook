import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketbook/language/language.dart';
import 'package:pocketbook/utils/app_style.dart';
import 'package:pocketbook/views/login/widget/button_widget.dart';
import 'package:pocketbook/views/setting/category/category_controller.dart';
import 'package:pocketbook/views/setting/category/widget/category_header_widget.dart';
import 'package:pocketbook/views/setting/widget/header_widget.dart';

class CategoryView extends GetWidget<CategoryController> {
  const CategoryView({super.key});

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
            HeaderWidget(title: LanguageKey.category.tr),

            /// Depense
            Obx(
              () => CategoryHeaderWidget(
                itemSelected: controller.indicatorSelected.value,
                indicatorSelectedAction: (String selected) {
                  controller.indicatorSelected.value = selected;
                },
              ),
            ),

            /// Body
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Obx(
                  () {
                    final listCategory = controller.listCategories.value
                        .where((element) =>
                            controller.indicatorSelected.value ==
                                    LanguageKey.expense.tr
                                ? (element.type == LanguageKey.expense.tr)
                                : (element.type != LanguageKey.expense.tr))
                        .toList();
                    return GridView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.zero,
                      itemCount: listCategory.length,
                      itemBuilder: (BuildContext context, int index) {
                        final item = listCategory[index];
                        final width =
                            ((MediaQuery.of(context).size.width - 32) / 4);
                        return SizedBox(
                          width: width,
                          height: 99.0,
                          child: InkWell(
                            onTap: () {
                              controller.navigateToDetailCategory(item);
                            },
                            child: SizedBox(
                              width: width,
                              height: 99.0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  /// Image
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 5),
                                    width: 56.0,
                                    height: 56.0,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(28.0),
                                      color: AppColor.grey201913,
                                    ),
                                  ),

                                  /// Name
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 1.5),
                                    alignment: Alignment.center,
                                    child: Text(
                                      item.name ?? '',
                                      textAlign: TextAlign.center,
                                      style: TextStyles.normalTextStyle(
                                        size: 12.0,
                                        color: AppColor.black1C2030,
                                      ),
                                      maxLines: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 0.0,
                        mainAxisSpacing: 0.0,
                        childAspectRatio:
                            ((MediaQuery.of(context).size.width - 32) / 4) /
                                99.0,
                      ),
                    );
                  },
                ),
              ),
            ),

            /// Bottom Button
            SafeArea(
              top: false,
              bottom: true,
              child: Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 12.0),
                child: ButtonWidget(
                  title: LanguageKey.createNew.tr,
                  onTap: () {
                    controller.navigateAddCategory();
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
}
