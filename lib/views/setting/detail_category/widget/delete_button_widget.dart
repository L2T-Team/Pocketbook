import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketbook/language/language.dart';
import 'package:pocketbook/utils/app_asset.dart';
import 'package:pocketbook/utils/app_style.dart';

class DeleteButtonWidget extends StatelessWidget {
  final Function onTapDelete;
  const DeleteButtonWidget({
    super.key,
    required this.onTapDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      width: 100.0,
      alignment: Alignment.center,
      child: TextButton(
        style: TextButton.styleFrom(
          minimumSize: Size.zero,
          padding: EdgeInsets.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        onPressed: () {
          onTapDelete();
        },
        child: Container(
          alignment: Alignment.center,
          height: 30.0,
          width: 100.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// Icon Delete
              Container(
                width: 18.0,
                height: 18.0,
                alignment: Alignment.center,
                child: Image.asset(
                  AppImages.icDelete,
                  width: 18.0,
                  height: 18.0,
                  fit: BoxFit.cover,
                ),
              ),

              /// Delete
              Container(
                margin: const EdgeInsets.only(left: 8),
                child: Text(
                  LanguageKey.delete.tr,
                  style: TextStyles.mediumTextStyle(
                    size: 14.0,
                    color: AppColor.redE91C2B,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
