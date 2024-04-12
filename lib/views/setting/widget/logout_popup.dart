import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pocketbook/language/language.dart';
import 'package:pocketbook/utils/app_helper.dart';
import 'package:pocketbook/utils/app_routes.dart';
import 'package:pocketbook/utils/app_style.dart';
import 'package:get/get.dart';

class LogoutPopup extends StatelessWidget {
  const LogoutPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(child: SizedBox()),
        Container(
          width: 300.0,
          padding: const EdgeInsets.symmetric(
            vertical: 24.0,
            horizontal: 16.0,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: AppColor.white,
          ),
          child: Column(
            children: [
              /// Title
              Container(
                margin: const EdgeInsets.only(bottom: 24.0),
                alignment: Alignment.topCenter,
                child: Text(
                  LanguageKey.logOutDescription.tr,
                  style: TextStyles.mediumTextStyle(
                    size: 16.0,
                    color: AppColor.black1C2030,
                  ),
                ),
              ),

              /// Button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// Cancel
                  Container(
                    height: 40.0,
                    width: 101.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      color: AppColor.greyECEDF1,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24.0),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () {
                          /// Tap
                          Get.back();
                        },
                        child: Text(
                          LanguageKey.cancel.tr,
                          textAlign: TextAlign.center,
                          style: TextStyles.mediumTextStyle(
                            size: 16.0,
                            color: AppColor.black1C2030,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 16.0),

                  /// Yes, log out
                  Container(
                    height: 40.0,
                    width: 133.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      color: AppColor.redE91C2B,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24.0),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () async {
                          try {
                            await FirebaseAuth.instance.signOut();
                            /// Tap
                            Get.offAllNamed(RoutesName.login);
                          } catch (_) {
                            AppHelper.showError(
                              LanguageKey.somethingWentWrong.tr,
                            );
                          }
                        },
                        child: Text(
                          LanguageKey.yesLogOut.tr,
                          textAlign: TextAlign.center,
                          style: TextStyles.mediumTextStyle(
                            size: 16.0,
                            color: AppColor.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Expanded(child: SizedBox()),
      ],
    );
  }
}
