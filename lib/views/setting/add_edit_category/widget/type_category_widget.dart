import 'package:flutter/material.dart';
import 'package:pocketbook/language/language.dart';
import 'package:pocketbook/utils/app_asset.dart';
import 'package:pocketbook/utils/app_style.dart';
import 'package:get/get.dart';

class TypeCategoryWidget extends StatelessWidget {
  TypeCategoryWidget({
    super.key,
    required this.itemSelected,
    required this.selectedAction,
    required this.isIgnore,
  });
  final List<String> listIndicator = [
    LanguageKey.income.tr,
    LanguageKey.expense.tr,
  ];
  final String itemSelected;
  final Function(String) selectedAction;
  final bool isIgnore;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Label
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            LanguageKey.type.tr,
            textAlign: TextAlign.left,
            style: TextStyles.mediumTextStyle(
              size: 14.0,
              color: AppColor.black1C2030,
            ),
          ),
        ),

        /// Type
        SizedBox(
          height: 42,
          child: IgnorePointer(
            ignoring: isIgnore,
            child: Opacity(
              opacity: isIgnore ? 0.5 : 1,
              child: ListView.builder(
                itemCount: listIndicator.length,
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final item = listIndicator[index];
                  return Container(
                    height: 42.0,
                    width: 110.0,
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {
                        selectedAction(item);
                      },
                      child: Container(
                        height: 42.0,
                        width: 110.0,
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            /// Image
                            Container(
                              width: 24.0,
                              height: 24.0,
                              alignment: Alignment.center,
                              child: Image.asset(
                                item == itemSelected
                                    ? AppImages.icSelected
                                    : AppImages.icUnselected,
                                width: 24.0,
                                height: 24.0,
                                fit: BoxFit.cover,
                              ),
                            ),

                            /// Text
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(left: 8.0),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  item,
                                  textAlign: TextAlign.left,
                                  style: TextStyles.mediumTextStyle(
                                    size: 12.0,
                                    color: AppColor.black1C2030,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
