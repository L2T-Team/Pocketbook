import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketbook/utils/app_asset.dart';
import 'package:pocketbook/utils/app_style.dart';

class HeaderWidget extends StatelessWidget {
  final String title;
  const HeaderWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            AppColor.pinkF27781,
            AppColor.pinkF2A0C6,
          ],
        ),
      ),
      height: MediaQuery.of(context).padding.top + 54.0,
      child: Column(
        children: [
          const Expanded(child: SizedBox()),
          SizedBox(
            height: 54.0,
            child: Row(
              children: [
                /// Back
                Container(
                  height: 54.0,
                  width: 68.0,
                  alignment: Alignment.center,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                    child: Container(
                      height: 54.0,
                      width: 68.0,
                      alignment: Alignment.center,
                      child: Container(
                        height: 20.0,
                        width: 20.0,
                        alignment: Alignment.center,
                        child: Image.asset(
                          AppImages.icBack,
                          height: 20.0,
                          width: 20.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),

                /// Title
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyles.mediumTextStyle(
                        size: 18.0,
                        color: AppColor.white,
                      ),
                    ),
                  ),
                ),

                /// Spacing
                const SizedBox(width: 68.0)
              ],
            ),
          )
        ],
      ),
    );
  }
}
