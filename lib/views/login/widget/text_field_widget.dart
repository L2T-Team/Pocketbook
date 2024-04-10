import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pocketbook/utils/app_style.dart';

class TextFieldWidget extends StatelessWidget {
  final FocusNode focusNode;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final TextEditingController controller;
  final bool? enabled;
  final Function? onSubmitted;
  final bool? isObscured;
  final bool? isLatestTextField;
  final String hintText;
  final Widget? suffixIcon;
  final Function()? onTapSuffix;
  final String titleLabel;
  final Function(String)? onChange;
  final bool isFocus;

  const TextFieldWidget({
    super.key,
    required this.focusNode,
    required this.controller,
    required this.hintText,
    required this.titleLabel,
    required this.isFocus,
    this.keyboardType,
    this.inputFormatters,
    this.maxLength,
    this.enabled,
    this.onSubmitted,
    this.isObscured,
    this.isLatestTextField,
    this.suffixIcon,
    this.onTapSuffix,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Label
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            titleLabel,
            textAlign: TextAlign.left,
            style: TextStyles.mediumTextStyle(
              size: 14.0,
              color: AppColor.black1C2030,
            ),
          ),
        ),

        /// TextField
        Container(
          margin: const EdgeInsets.only(top: 2),
          height: 40,
          child: (enabled ?? true)
              ? TextField(
                  style: TextStyles.normalTextStyle(
                    color: AppColor.black201913,
                    size: 14.0,
                  ),
                  onChanged: onChange,
                  focusNode: focusNode,
                  keyboardType: keyboardType,
                  inputFormatters: inputFormatters,
                  maxLength: maxLength,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: controller,
                  enabled: enabled ?? true,
                  onSubmitted: (_) {
                    if (onSubmitted != null) onSubmitted!.call();
                  },
                  obscureText: isObscured ?? false,
                  textInputAction: isLatestTextField == true
                      ? TextInputAction.done
                      : TextInputAction.next,
                  decoration: InputDecoration(
                    counterText: '',
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: hintText,
                    hintStyle: TextStyles.normalTextStyle(
                      size: 14.0,
                      color: AppColor.grey575757,
                    ),
                    suffixIcon: onTapSuffix == null
                        ? suffixIcon
                        : Container(
                            alignment: Alignment.centerRight,
                            width: 25,
                            child: InkWell(
                              onTap: onTapSuffix,
                              child: suffixIcon,
                            ),
                          ),
                  ),
                )
              : TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: Size.zero,
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: () {
                    if (onTapSuffix != null) onTapSuffix!();
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            controller.text.isNotEmpty
                                ? controller.text
                                : hintText,
                            textAlign: TextAlign.left,
                            style: TextStyles.normalTextStyle(
                              color: controller.text.isNotEmpty
                                  ? AppColor.black201913
                                  : AppColor.grey575757,
                              size: 14.5,
                            ),
                          ),
                        ),
                        suffixIcon ?? const SizedBox(),
                      ],
                    ),
                  ),
                ),
        ),

        /// Line
        Container(
          height: 1,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isFocus
                  ? [
                      AppColor.pinkF27781,
                      AppColor.pinkF2A0C6,
                    ]
                  : [
                      AppColor.greyC5C8D4,
                      AppColor.greyC5C8D4,
                    ],
            ),
          ),
        )
      ],
    );
  }
}
