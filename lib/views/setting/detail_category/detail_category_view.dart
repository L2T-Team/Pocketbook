import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketbook/language/language.dart';
import 'package:pocketbook/utils/app_style.dart';
import 'package:pocketbook/views/login/widget/button_widget.dart';
import 'package:pocketbook/views/setting/detail_category/detail_category_controller.dart';
import 'package:pocketbook/views/setting/detail_category/widget/delete_button_widget.dart';
import 'package:pocketbook/views/setting/widget/header_widget.dart';

class DetailCategoryView extends GetWidget<DetailCategoryController> {
  const DetailCategoryView({super.key});

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
            HeaderWidget(title: LanguageKey.categoryDetail.tr),

            /// Body
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 24.0,
                ),
                child: Obx(() => Column(
                      children: [
                        /// Image
                        Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          width: 80.0,
                          height: 80.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40.0),
                            color: AppColor.grey201913.withOpacity(0.5),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40.0),
                            child: Obx(
                              () => (controller.categoryDetail.value?.image ??
                                          '')
                                      .isNotEmpty
                                  ? Image.network(
                                      (controller.categoryDetail.value?.image ??
                                          ''),
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        }

                                        return Center(
                                          child: CircularProgressIndicator(
                                            value: (loadingProgress
                                                    .cumulativeBytesLoaded /
                                                (loadingProgress
                                                        .expectedTotalBytes ??
                                                    0)),
                                          ),
                                        );
                                      },
                                    )
                                  : const SizedBox(),
                            ),
                          ),
                        ),

                        /// Name
                        _buildItemLabel(
                          LanguageKey.name.tr,
                          controller.categoryDetail.value?.name ?? '',
                        ),

                        /// Type
                        _buildItemLabel(
                          LanguageKey.type.tr,
                          controller.categoryDetail.value?.type ?? '',
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
                  controller.deleteCategory(
                    context,
                    controller.categoryDetail.value!,
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
                    controller.navigateEditCategory();
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
      margin: const EdgeInsets.only(top: 18.0),
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
