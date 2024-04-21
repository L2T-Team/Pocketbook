import 'package:flutter/material.dart';
import 'package:pocketbook/language/language.dart';
import 'package:pocketbook/utils/app_style.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:get/get.dart';

class CategoryHeaderWidget extends StatelessWidget {
  CategoryHeaderWidget({
    super.key,
    required this.itemSelected,
    required this.indicatorSelectedAction,
  });
  final List<String> listIndicator = [
    LanguageKey.expense.tr,
    LanguageKey.income.tr,
  ];
  final String itemSelected;
  final Function(String) indicatorSelectedAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 79.0,
      alignment: Alignment.center,
      child: Container(
        height: 31.0,
        width: 182.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: AppColor.white,
          border: Border.all(
            width: 1,
            color: AppColor.pinkF27781,
          ),
        ),
        alignment: Alignment.center,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: ListView.builder(
            itemCount: listIndicator.length,
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final item = listIndicator[index];
              return Container(
                height: 31.0,
                width: 182.0 / 2.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: item == itemSelected
                        ? [
                            AppColor.pinkF27781,
                            AppColor.pinkF2A0C6,
                          ]
                        : [AppColor.white, AppColor.white],
                  ),
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: Size.zero,
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: () {
                    indicatorSelectedAction(item);
                  },
                  child: Container(
                    height: 31.0,
                    width: 182.0 / 2.0,
                    alignment: Alignment.center,
                    child: item == itemSelected
                        ? Text(
                            item,
                            textAlign: TextAlign.center,
                            style: TextStyles.mediumTextStyle(
                              size: 12.0,
                              color: AppColor.white,
                            ),
                          )
                        : GradientText(
                            item,
                            style: TextStyles.mediumTextStyle(
                              size: 12.0,
                            ),
                            textAlign: TextAlign.center,
                            colors: const [
                              AppColor.pinkF27781,
                              AppColor.pinkF2A0C6,
                            ],
                          ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
