import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketbook/language/language.dart';
import 'package:pocketbook/utils/app_style.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({
    super.key,
    required this.title,
    required this.message,
    this.onTap,
    this.onCancel,
    this.displaySecondButton = true,
  });

  final String title;
  final String? message;
  final Function()? onTap;
  final Function()? onCancel;
  final bool displaySecondButton;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      backgroundColor: AppColor.greyDCDCDC,
      child: Wrap(
        children: [
          Column(
            children: [
              Text(
                title,
                style: TextStyles.semiBoldTextStyle(
                  color: AppColor.black.withOpacity(.96),
                  size: 16,
                  height: 1.38,
                ),
                textAlign: TextAlign.center,
              ).paddingOnly(
                left: 16,
                right: 16,
                top: 19,
                bottom: 4,
              ),
              const SizedBox(height: 2),
              if (message != null) ...[
                Text(
                  message!,
                  style: TextStyles.normalTextStyle(
                    color: AppColor.black.withOpacity(.5),
                    size: 16,
                  ),
                  textAlign: TextAlign.center,
                ).paddingSymmetric(horizontal: 16),
                const SizedBox(height: 24),
              ] else
                const SizedBox(height: 17),
              const Divider(height: 0),
              onTap != null
                  ? InkWell(
                      onTap: () {
                        Get.back();
                        onTap?.call();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 11),
                        width: double.maxFinite,
                        child: Text(
                          LanguageKey.yes.tr,
                          style: TextStyles.lightTextStyle(
                            color: AppColor.grey007AFF,
                            fontFamily: NameFont.dMSans,
                            size: 17,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
              displaySecondButton
                  ? InkWell(
                      borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(15),),
                      onTap: () {
                        Get.back();
                        onCancel?.call();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 11),
                        width: double.maxFinite,
                        child: Text(
                          onTap != null
                              ? LanguageKey.no.tr
                              : LanguageKey.ok.tr,
                          style: TextStyles.lightTextStyle(
                            color: AppColor.grey007AFF,
                            fontFamily: NameFont.dMSans,
                            size: 17,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ],
      ),
    );
  }
}