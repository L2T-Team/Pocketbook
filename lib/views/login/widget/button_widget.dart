import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pocketbook/utils/app_style.dart';

class ButtonWidget extends StatelessWidget {
  final Color? bgColor;
  final String title;
  final Function onTap;
  final bool enable;
  final bool isLoading;

  const ButtonWidget({
    super.key,
    this.bgColor,
    required this.title,
    required this.onTap,
    required this.enable,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    final Widget textWidget = Container(
      alignment: Alignment.center,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyles.mediumTextStyle(
          size: 16.0,
          color: AppColor.white,
        ),
      ),
    );
    return isLoading
        ? Container(
            height: 48.0,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  AppColor.pinkF27781,
                  AppColor.pinkF2A0C6,
                ],
              ),
            ),
            child: Center(
              child: LoadingAnimationWidget.inkDrop(
                color: Colors.white,
                size: 20,
              ),
            ),
          )
        : Container(
            height: 48.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: !enable
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24.0),
              child: enable
                  ? TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {
                        onTap();
                      },
                      child: textWidget,
                    )
                  : textWidget,
            ),
          );
  }
}
