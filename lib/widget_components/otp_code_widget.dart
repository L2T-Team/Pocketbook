/*
 * Developed by Hiep Le on 9/10/21, 2:10 PM.
 * Last modified 9/10/21, 2:10 PM.
 * Copyright (c) 2021 BeeSight Soft. All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pocketbook/utils/app_style.dart';

class OTPCodeWidget extends StatefulWidget {
  const OTPCodeWidget({
    super.key,
    this.maxCodeLength = 6,
    this.margin,
    this.onChanged,
    this.onSubmitted,
    this.controller,
  });

  final TextEditingController? controller;
  final int maxCodeLength;
  final EdgeInsetsGeometry? margin;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;

  @override
  State<OTPCodeWidget> createState() => _OTPCodeWidgetState();
}

class _OTPCodeWidgetState extends State<OTPCodeWidget> {
  FocusNode focusNode = FocusNode();
  late TextEditingController codeTextController;
  late Color borderColor;

  @override
  void initState() {
    borderColor = AppColor.greyDCDCDC;
    codeTextController = widget.controller ?? TextEditingController();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          borderColor = AppColor.black;
        });
      } else {
        setState(() {
          borderColor = AppColor.greyDCDCDC;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: ValueListenableBuilder<TextEditingValue>(
        valueListenable: codeTextController,
        builder: (_, codeValue, __) {
          final currentCodeLength = codeValue.text.length;
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(focusNode);
            },
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int index = 0;
                      index < widget.maxCodeLength;
                      index++) ...[
                    _buildCodeItem(index, currentCodeLength),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCodeItem(int index, int currentCodeLength) {
    return Container(
      width:
          (MediaQuery.of(context).size.width - (32 * 2 + 16 * 2 + 7 * 5)) / 6,
      height: 60,
      margin: EdgeInsets.only(
        right: index < widget.maxCodeLength - 1 ? 7 : 0,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
        color: AppColor.greyF8F7F6,
      ),
      child: Stack(
        children: [
          _buildCodeText(index, currentCodeLength),
          _buildCodeTextFieldBack(isShowTextField: index == 0),
        ],
      ),
    );
  }

  Widget _buildCodeText(int index, int currentCodeLength) {
    return Center(
      child: (index > currentCodeLength - 1)
          ? const SizedBox()
          : Text(
              codeTextController.text[index],
              style: TextStyles.semiBoldTextStyle(size: 24),
            ),
    );
  }

  Widget _buildCodeTextFieldBack({bool isShowTextField = false}) {
    if (!isShowTextField) {
      return const SizedBox.shrink();
    }
    return Center(
      child: TextField(
        controller: codeTextController,
        focusNode: focusNode,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(widget.maxCodeLength),
        ],
        keyboardAppearance: Brightness.dark,
        textInputAction: TextInputAction.done,
        decoration: const InputDecoration(
          border: InputBorder.none,
          counterText: "",
        ),
        enableInteractiveSelection:
            isShowTextField && codeTextController.text.isEmpty,
        autocorrect: false,
        autofocus: true,
        onSubmitted: widget.onSubmitted,
        magnifierConfiguration: TextMagnifierConfiguration.disabled,
        cursorWidth: 0,
        showCursor: false,
        maxLength: widget.maxCodeLength,
        style: const TextStyle(color: Colors.transparent),
        onChanged: (text) {
          widget.onChanged?.call(text);
          if (codeTextController.text.length == widget.maxCodeLength) {
            _confirmPinCode();
          }
        },
      ),
    );
  }

  void _confirmPinCode() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  @override
  void dispose() {
    codeTextController.dispose();
    super.dispose();
  }
}
