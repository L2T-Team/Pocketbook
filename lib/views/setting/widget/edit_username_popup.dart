import 'package:flutter/material.dart';
import 'package:pocketbook/language/language.dart';
import 'package:pocketbook/utils/app_style.dart';
import 'package:get/get.dart';
import 'package:pocketbook/views/login/widget/text_field_widget.dart';

class EditUsernamePopup extends StatefulWidget {
  final Function confirmAction;
  final FocusNode focusNodeUsername;
  final TextEditingController controllerUsername;
  final bool isFocusUsername;
  const EditUsernamePopup({
    super.key,
    required this.confirmAction,
    required this.focusNodeUsername,
    required this.controllerUsername,
    required this.isFocusUsername,
  });

  @override
  State<StatefulWidget> createState() {
    return EditUsernamePopupState();
  }
}

class EditUsernamePopupState extends State<EditUsernamePopup> {
  bool isEnableButton = false;

  @override
  void initState() {
    super.initState();
    validateButtonAction();
  }

  void validateButtonAction() {
    Future.delayed(const Duration(milliseconds: 20)).then((value) {
      isEnableButton = widget.controllerUsername.text.trim().isNotEmpty;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
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
                // Container(
                //   margin: const EdgeInsets.only(bottom: 12.0),
                //   alignment: Alignment.topCenter,
                //   child: Text(
                //     LanguageKey.babyVisitConfirm.tr,
                //     textAlign: TextAlign.center,
                //     style: TextStyles.mediumTextStyle(
                //       size: 16.0,
                //       color: AppColor.black1C2030,
                //     ),
                //   ),
                // ),

                /// Sub Title
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 24.0),
                  child: TextFieldWidget(
                    titleLabel: LanguageKey.username.tr,
                    focusNode: widget.focusNodeUsername,
                    controller: widget.controllerUsername,
                    hintText: LanguageKey.username.tr,
                    onChange: (String text) {
                      validateButtonAction();
                    },
                    isFocus: widget.isFocusUsername,
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

                    /// Save
                    Container(
                      height: 40.0,
                      width: 114.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.0),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: !isEnableButton
                              ? [
                                  AppColor.grey8C8C8C,
                                  AppColor.greyC7C7C7,
                                ]
                              : [
                                  AppColor.pinkF27781,
                                  AppColor.pinkF2A0C6,
                                ],
                        ),
                      ),
                      alignment: Alignment.center,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24.0),
                        child: isEnableButton
                            ? TextButton(
                                style: TextButton.styleFrom(
                                  minimumSize: Size.zero,
                                  padding: EdgeInsets.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                onPressed: () {
                                  /// Tap
                                  Get.back();
                                  widget.confirmAction();
                                },
                                child: Text(
                                  LanguageKey.save.tr,
                                  textAlign: TextAlign.center,
                                  style: TextStyles.mediumTextStyle(
                                    size: 16.0,
                                    color: AppColor.white,
                                  ),
                                ),
                              )
                            : Text(
                                LanguageKey.save.tr,
                                textAlign: TextAlign.center,
                                style: TextStyles.mediumTextStyle(
                                  size: 16.0,
                                  color: AppColor.white,
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
      ),
    );
  }
}
