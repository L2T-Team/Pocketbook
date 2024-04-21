import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pocketbook/utils/app_style.dart';

class AmountTextFieldWidget extends StatelessWidget {
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

  const AmountTextFieldWidget({
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /// Label
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(bottom: 20.0, right: 12.0),
          child: Text(
            '\$',
            textAlign: TextAlign.center,
            style: TextStyles.normalTextStyle(
              size: 40.0,
              color: AppColor.black1C2030,
            ),
          ),
        ),

        /// TextField
        SizedBox(
          width: 125.0,
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: TextField(
                  style: TextStyles.normalTextStyle(
                    color: AppColor.black201913,
                    size: 40.0,
                  ),
                  onChanged: onChange,
                  focusNode: focusNode,
                  keyboardType: keyboardType,
                  inputFormatters: inputFormatters ??
                      [
                        FilteringTextInputFormatter.allow(RegExp(r"[0-9.,]")),
                        TextInputFormatter.withFunction((oldValue, newValue) {
                          final text = newValue.text;
                          return text.isEmpty
                              ? newValue
                              : double.tryParse(text.replaceAll(',', '.')) ==
                                      null
                                  ? oldValue
                                  : newValue;
                        }),
                      ],
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
                    contentPadding: const EdgeInsets.all(0.0),
                    isDense: true,
                    counterText: '',
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: hintText,
                    hintStyle: TextStyles.normalTextStyle(
                      size: 40.0,
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
                  maxLines: 1,
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
              ),
            ],
          ),
        ),
      ],
    );
  }
}
