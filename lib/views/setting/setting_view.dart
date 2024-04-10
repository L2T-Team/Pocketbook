
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketbook/language/language.dart';
import 'package:pocketbook/utils/app_asset.dart';
import 'package:pocketbook/utils/app_style.dart';
import 'package:pocketbook/views/setting/setting_controller.dart';
import 'package:pocketbook/views/setting/widget/avatar_header_widget.dart';

class SettingView extends GetWidget<SettingController> {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            /// Header
            const AvatarHeaderWidget(username: 'Lam Le',),
            /// Body
            Expanded(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  _buildButton(
                    context,
                    LanguageKey.category.tr,
                    AppImages.icCategory,
                    () {
                      controller.navigateCategory();
                    },
                  ),
                  _buildButton(
                    context,
                    LanguageKey.logOut.tr,
                    AppImages.icLogOut,
                    () {
                      controller.logOutAction(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(
    BuildContext context,
    String title,
    String image,
    Function onTap,
  ) {
    return SizedBox(
      height: 40,
      child: TextButton(
        style: TextButton.styleFrom(
          minimumSize: Size.zero,
          padding: EdgeInsets.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        onPressed: () {
          onTap();
        },
        child: Row(
          children: [
            SizedBox(
              width: 24.0,
              height: 24.0,
              child: Image.asset(
                image,
                width: 24.0,
                height: 24.0,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 24.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  textAlign: TextAlign.left,
                  style: TextStyles.normalTextStyle(
                    size: 14.0,
                    color: AppColor.black,
                  ),
                ),
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 16.0),
      ),
    );
  }
}
