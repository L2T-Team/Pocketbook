import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:pocketbook/language/language.dart';
import 'package:pocketbook/utils/app_asset.dart';
import 'package:pocketbook/utils/app_style.dart';
import 'package:pocketbook/views/login/widget/button_widget.dart';
import 'package:pocketbook/views/login/widget/text_field_widget.dart';
import 'package:pocketbook/views/setting/add_edit_category/add_edit_category_controller.dart';
import 'package:pocketbook/views/setting/add_edit_category/widget/type_category_widget.dart';
import 'package:pocketbook/views/setting/widget/header_widget.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class AddEditCategoryView extends GetWidget<AddEditCategoryController> {
  const AddEditCategoryView({super.key});

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
            Obx(
              () => HeaderWidget(
                title: controller.categoryDetail.value != null
                    ? LanguageKey.editNewCategory.tr
                    : LanguageKey.addNewCategory.tr,
              ),
            ),

            /// Body
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 24.0,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      /// Image
                      GestureDetector(
                        onTap: () {
                          controller.photoAction(context);
                        },
                        child: Container(
                          width: 80.0,
                          height: 80.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40.0),
                            color: AppColor.grey201913.withOpacity(0.4),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40.0),
                            child: Obx(
                              () => controller.imageUrl.value.isNotEmpty
                                  ? CachedNetworkImage(
                                      imageUrl: controller.imageUrl.value,
                                      width: 80.0,
                                      height: 80.0,
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) =>
                                          SpinKitCircle(
                                        color: Colors.black.withOpacity(0.5),
                                      ),
                                    )
                                  : Image.asset(
                                      AppImages.icImage,
                                      width: 80.0,
                                      height: 80.0,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                        ),
                      ),

                      /// Name Image/Add/Update
                      GestureDetector(
                        onTap: () {
                          controller.photoAction(context);
                        },
                        child: Obx(
                          () => Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(top: 12.0),
                            child: GradientText(
                              controller.categoryDetail.value == null
                                  ? LanguageKey.addImage.tr
                                  : LanguageKey.updatePhoto.tr,
                              style: TextStyles.mediumTextStyle(
                                size: 12.0,
                              ),
                              textAlign: TextAlign.center,
                              colors: const [
                                AppColor.pinkF27781,
                                AppColor.pinkF2A0C6,
                              ],
                            ),
                          ),
                        ),
                      ),

                      /// Name Category
                      Obx(
                        () => Container(
                          margin: const EdgeInsets.only(top: 24),
                          child: TextFieldWidget(
                            titleLabel: LanguageKey.name.tr,
                            focusNode: controller.focusNodeName,
                            controller: controller.controllerName,
                            hintText: LanguageKey.name.tr,
                            onChange: (String text) {
                              controller.validateButtonAction();
                            },
                            isFocus: controller.isFocusName.value,
                          ),
                        ),
                      ),

                      /// Type Category
                      Obx(
                        () => Container(
                          margin: const EdgeInsets.only(top: 24),
                          child: TypeCategoryWidget(
                            itemSelected: controller.itemSelected.value,
                            selectedAction: (String selected) {
                              controller.itemSelected.value = selected;
                            },
                            isIgnore: controller.categoryDetail.value != null,
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
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
                child: Obx(
                  () => ButtonWidget(
                    title: controller.categoryDetail.value != null
                        ? LanguageKey.save.tr
                        : LanguageKey.createNew.tr,
                    onTap: () {
                      controller.addEditAction(context);
                    },
                    enable: controller.enableButton.value,
                    isLoading: controller.isLoading.value,
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
