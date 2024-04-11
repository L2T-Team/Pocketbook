import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketbook/language/language.dart';
import 'package:pocketbook/model/responses/date_calendar_model.dart';
import 'package:pocketbook/utils/app_constant.dart';
import 'package:pocketbook/utils/app_helper.dart';
import 'package:pocketbook/utils/app_style.dart';
import 'package:pocketbook/views/home/add_edit_transaction/widget/date_widget.dart';
import 'package:pocketbook/views/kid/kid_controller.dart';
import 'package:pocketbook/widget_components/gridview_dynamic_widget.dart';
import 'package:tap_debouncer/tap_debouncer.dart';

class CalendarWidget extends GetView<KidController> {
  CalendarWidget({
    super.key,
  });

  final styleNormal = TextStyles.normalTextStyle(
    color: AppColor.black1C2030,
    size: 14.0,
  );
  final heightHeader = 28.0;

  /// BUILD
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.zero,
        itemCount: controller.listDate.length,
        itemBuilder: (BuildContext context, int index) {
          final listDateItem = controller.listDate[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                /// HEADER NEXT PREVIOUS
                SizedBox(
                  height: 56,
                  child: Obx(
                    () => DateWidget(
                      format: DateConstant.dateMMYYYY,
                      date: controller.currentDate.value,
                      nextAction: controller.nextDateAction,
                      previousAction: controller.previousDateAction,
                      selectedDateAction: (DateTime date) {
                        controller.currentDate.value = date;
                      },
                    ),
                  ),
                ),

                /// LIST DATE IN WEEK
                _buildListDateInWeek(context),

                /// LIST DATE IN MONTH
                _buildListDateInMonth(context, listDateItem),
              ],
            ),
          );
        },
      ),
    );
  }

  /// LIST DATE IN WEEK
  Widget _buildListDateInWeek(context) {
    final List<String> list = [
      LanguageKey.mon.tr,
      LanguageKey.tue.tr,
      LanguageKey.wed.tr,
      LanguageKey.thu.tr,
      LanguageKey.fri.tr,
      LanguageKey.sat.tr,
      LanguageKey.sun.tr,
    ];

    final double width = (MediaQuery.of(context).size.width - 32.0) / 7.0;
    return SizedBox(
      height: heightHeader,
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.zero,
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: width,
              height: heightHeader,
              alignment: Alignment.center,
              child: Text(
                list[index],
                textAlign: TextAlign.center,
                style: styleNormal,
              ),
            );
          }),
    );
  }

  /// DATE IN MONTH
  Widget _buildListDateInMonth(
      BuildContext context, List<DateCalendarModel> dateTimes) {
    const double height = 52;
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.zero,
      itemCount: dateTimes.length,
      itemBuilder: (BuildContext context, int index) {
        final item = dateTimes[index];
        return Obx(
          () => _buildItemDate(context, item),
        );
      },
      shrinkWrap: true,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
        crossAxisCount: 7,
        crossAxisSpacing: 0.0,
        mainAxisSpacing: 0.0,
        height: height,
      ),
    );
  }

  /// ITEM DATE
  Widget _buildItemDate(BuildContext context, DateCalendarModel item) {
    bool isSelected = false;
    bool isToday = false;
    bool isCurrentMonth = item.isCurrentMonth;

    isToday = AppHelper.checkTheSameDate(item.datetime, DateTime.now());
    isSelected = AppHelper.checkTheSameDate(
      item.datetime,
      controller.currentDate.value,
    );

    return TapDebouncer(
      onTap: () async {
        controller.currentDate(item.datetime);
      },
      builder: (context, onTap) => InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// Date
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      AppColor.pinkF27781.withOpacity(isSelected ? 1 : 0),
                      AppColor.pinkF2A0C6.withOpacity(isSelected ? 1 : 0),
                    ],
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  item.datetime.day.toString(),
                  textAlign: TextAlign.center,
                  style: styleNormal.copyWith(
                    color: isToday
                        ? AppColor.black1C2030
                        : isSelected
                            ? AppColor.white
                            : isCurrentMonth
                                ? AppColor.black1C2030
                                : AppColor.greyA9ADBF,
                  ),
                ),
              ),

              /// Event
              Container(
                margin: const EdgeInsets.only(top: 2),
                width: 6.0,
                height: 6.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.0),
                  color: AppColor.orangeF2AA88,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
