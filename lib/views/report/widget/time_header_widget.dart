import 'package:flutter/material.dart';
import 'package:pocketbook/language/language.dart';
import 'package:pocketbook/utils/app_style.dart';
import 'package:get/get.dart';

class TimeHeaderWidget extends StatelessWidget {
  final List<String> listTimes = [
    LanguageKey.day.tr,
    LanguageKey.month.tr,
    LanguageKey.year.tr,
    // LanguageKey.period.tr,
  ];
  final String itemSelected;
  final Function(String) selectedAction;
  TimeHeaderWidget({
    super.key,
    required this.itemSelected,
    required this.selectedAction,
  });

  @override
  Widget build(BuildContext context) {
    final double width = (MediaQuery.of(context).size.width - 32) / listTimes.length;
    return Container(
      height: 63.0,
      alignment: Alignment.center,
      child: Container(
        height: 31,
        alignment: Alignment.center,
        child: ListView.builder(
          itemCount: listTimes.length,
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final item = listTimes[index];
            return Container(
              height: 31.0,
              width: width,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    AppColor.pinkF27781
                        .withOpacity(item == itemSelected ? 1 : 0),
                    AppColor.pinkF2A0C6
                        .withOpacity(item == itemSelected ? 1 : 0),
                  ],
                ),
              ),
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
                  height: 31.0,
                  width: width,
                  alignment: Alignment.center,
                  child: Text(
                    item,
                    textAlign: TextAlign.center,
                    style: item == itemSelected
                        ? TextStyles.mediumTextStyle(
                            size: 12.0,
                            color: AppColor.white,
                          )
                        : TextStyles.normalTextStyle(
                            size: 12.0,
                            color: AppColor.black1C2030,
                          ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
