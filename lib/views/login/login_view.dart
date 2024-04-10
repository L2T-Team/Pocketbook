import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketbook/language/language.dart';
import 'package:pocketbook/utils/app_asset.dart';
import 'package:pocketbook/utils/app_routes.dart';
import 'package:pocketbook/utils/app_style.dart';
import 'package:pocketbook/views/login/login_controller.dart';
import 'package:pocketbook/views/login/widget/button_widget.dart';
import 'package:pocketbook/views/login/widget/text_field_widget.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class LoginView extends GetWidget<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            /// BG
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                AppImages.icBg,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
            ),

            /// Opacity Black
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: AppColor.black.withOpacity(0.5),
            ),

            /// Body
            Scaffold(
              backgroundColor: Colors.transparent,
              resizeToAvoidBottomInset: true,
              body: Column(
                children: [
                  const Expanded(child: SizedBox()),
                  Container(
                    padding: const EdgeInsets.all(32.0),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24.0),
                        topRight: Radius.circular(24.0),
                      ),
                      color: AppColor.greyFEF6FA,
                    ),
                    child: Column(
                      children: [
                        /// Title
                        Container(
                          alignment: Alignment.centerLeft,
                          child: GradientText(
                            LanguageKey.welcomeBack.tr,
                            style: TextStyles.boldTextStyle(
                              size: 24.0,
                            ),
                            colors: const [
                              AppColor.pinkF27781,
                              AppColor.pinkF2A0C6,
                            ],
                          ),
                        ),

                        /// Username
                        Obx(
                          () => Container(
                            margin: const EdgeInsets.only(top: 30),
                            child: TextFieldWidget(
                              titleLabel: LanguageKey.username.tr,
                              focusNode: controller.focusNodeUsername,
                              controller: controller.controllerUsername,
                              hintText: LanguageKey.username.tr,
                              onChange: (String text) {
                                controller.validateButtonAction();
                              },
                              isFocus: controller.isFocusUsername.value,
                            ),
                          ),
                        ),

                        /// Password
                        Obx(
                          () => Container(
                            margin: const EdgeInsets.symmetric(vertical: 30),
                            child: TextFieldWidget(
                              titleLabel: LanguageKey.password.tr,
                              focusNode: controller.focusNodePassword,
                              controller: controller.controllerPassword,
                              hintText: LanguageKey.password.tr,
                              isObscured: controller.isObsecure.value,
                              isLatestTextField: true,
                              isFocus: controller.isFocusPassword.value,
                              suffixIcon: Container(
                                alignment: Alignment.centerRight,
                                child: SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Image.asset(
                                    controller.isObsecure.value
                                        ? AppImages.icEyeNot
                                        : AppImages.icEyeSee,
                                    color: AppColor.pinkF27781,
                                    width: 20,
                                    height: 20,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              onTapSuffix: () {
                                controller.isObsecure.value =
                                    !controller.isObsecure.value;
                              },
                              onChange: (String text) {
                                controller.validateButtonAction();
                              },
                            ),
                          ),
                        ),

                        /// Button
                        Obx(
                          () => ButtonWidget(
                            title: LanguageKey.login.tr,
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              Get.toNamed(RoutesName.main);
                              // controller.login(
                              //   controller.controllerUsername.text,
                              //   controller.controllerPassword.text,
                              //   context,
                              // );
                            },
                            enable: controller.enableButton.value,
                            isLoading: controller.isLoading.value,
                          ),
                        ),

                        /// SafeArea
                        const SafeArea(
                          top: false,
                          bottom: true,
                          child: SizedBox(
                            height: 5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
