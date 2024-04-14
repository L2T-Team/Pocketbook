import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketbook/language/language.dart';
import 'package:pocketbook/model/responses/date_calendar_model.dart';
import 'package:pocketbook/model/responses/kid_confirm_model.dart';
import 'package:pocketbook/utils/app_asset.dart';
import 'package:pocketbook/utils/app_constant.dart';
import 'package:pocketbook/utils/app_helper.dart';
import 'package:pocketbook/utils/app_style.dart';

class HistoryYearWidget extends StatefulWidget {
  final List<KidConfirmModel> listKids;
  const HistoryYearWidget({
    super.key,
    required this.listKids,
  });

  @override
  State<StatefulWidget> createState() {
    return HistoryYearWidgetState();
  }
}

class HistoryYearWidgetState extends State<HistoryYearWidget> {
  List<YearModel> listYears = [];

  @override
  void initState() {
    super.initState();

    /// Year
    for (int ye = 1950; ye <= 2050; ye++) {
      final filterYear = widget.listKids.where((element) {
        final dateShow = AppHelper.convertStringToDateWithFormat(
          element.date ?? '',
          DateConstant.dateMMddYYYY,
        );
        return dateShow.year == ye;
      }).toList();
      if (filterYear.isNotEmpty) {
        listYears.add(
          YearModel(
            year: ye,
            isDropdown: true,
            listMonths: [],
          ),
        );
      }
    }

    /// Month
    for (var year = 0; year < listYears.length; year++) {
      List<KidGroupConfirmModel> listMonths = [];
      for (int i = 1; i <= 12; i++) {
        final filter = widget.listKids.where((element) {
          final dateShow = AppHelper.convertStringToDateWithFormat(
            element.date ?? '',
            DateConstant.dateMMddYYYY,
          );
          return dateShow.year == listYears[year].year && dateShow.month == i;
        }).toList();
        listMonths.add(KidGroupConfirmModel(
          isDropdown: false,
          month: i,
          listKids: filter,
        ));
      }
      listYears[year].listMonths = listMonths;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 9.0),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: listYears.length,
        shrinkWrap: true,
        itemBuilder: (conext, inYear) {
          final year = listYears[inYear];
          int numberConfirm = 0;
          for (KidGroupConfirmModel m in (year.listMonths)) {
            numberConfirm += m.listKids.length;
          }
          return Column(
            children: [
              const SizedBox(height: 9),

              /// Year Title
              Container(
                height: 44.0,
                alignment: Alignment.centerLeft,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColor.pinkF27781,
                      AppColor.pinkF2A0C6,
                    ],
                  ),
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: Size.zero,
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {
                    listYears[inYear].isDropdown =
                        !listYears[inYear].isDropdown;
                    setState(() {});
                  },
                  child: Container(
                    height: 44.0,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          alignment: Alignment.center,
                          child: Image.asset(
                            year.isDropdown
                                ? AppImages.icDropdownWhite
                                : AppImages.icDropdownWhiteNext,
                            width: 20,
                            height: 20,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 8.0),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '${year.year} ($numberConfirm)',
                              textAlign: TextAlign.left,
                              style: TextStyles.mediumTextStyle(
                                size: 16.0,
                                color: AppColor.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              /// List Month
              !year.isDropdown
                  ? const SizedBox(height: 0)
                  : ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: listYears[inYear].listMonths.length,
                      shrinkWrap: true,
                      itemBuilder: (conext, indexTr) {
                        final group = listYears[inYear].listMonths[indexTr];
                        return Column(
                          children: [
                            /// Header Month
                            SizedBox(
                              height: 44.0,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  minimumSize: Size.zero,
                                  padding: EdgeInsets.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                onPressed: () {
                                  listYears[inYear]
                                          .listMonths[indexTr]
                                          .isDropdown =
                                      !listYears[inYear]
                                          .listMonths[indexTr]
                                          .isDropdown;
                                  setState(() {});
                                },
                                child: Container(
                                  height: 44.0,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 20,
                                        height: 20,
                                        alignment: Alignment.center,
                                        child: Image.asset(
                                          group.isDropdown
                                              ? AppImages.icDropdown
                                              : AppImages.icDropdownNext,
                                          width: 20,
                                          height: 20,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(left: 8.0),
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            '${AppHelper.convertDatetoStringWithFormat(DateTime(year.year, group.month, 1), DateConstant.dateMMMM)} (${group.listKids.length})',
                                            textAlign: TextAlign.left,
                                            style: TextStyles.mediumTextStyle(
                                              size: 16.0,
                                              color: AppColor.black1C2030,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            /// Line
                            Container(
                              height: 1,
                              color: AppColor.greyECEDF1,
                            ),

                            /// Body List
                            group.isDropdown
                                ? ListView.builder(
                                    padding: EdgeInsets.zero,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: group.listKids.length,
                                    shrinkWrap: true,
                                    itemBuilder: (conext, index) {
                                      final kid = listYears[inYear]
                                          .listMonths[indexTr]
                                          .listKids[index];
                                      return Container(
                                        height: 48.0,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 16.0),
                                        child: Row(
                                          children: [
                                            /// Image
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  right: 16.0),
                                              width: 40.0,
                                              height: 40.0,
                                              alignment: Alignment.center,
                                              child: Image.asset(
                                                AppImages.icKid,
                                                width: 40.0,
                                                height: 40.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),

                                            /// Expanded
                                            Expanded(
                                              child: Container(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  LanguageKey.kid.tr,
                                                  textAlign: TextAlign.left,
                                                  style: TextStyles
                                                      .mediumTextStyle(
                                                    size: 14.0,
                                                    color: AppColor.black1C2030,
                                                  ),
                                                ),
                                              ),
                                            ),

                                            /// Amount
                                            Container(
                                              alignment: Alignment.centerRight,
                                              margin: const EdgeInsets.only(
                                                  right: 2),
                                              child: Text(
                                                kid.date ?? '',
                                                textAlign: TextAlign.left,
                                                style:
                                                    TextStyles.normalTextStyle(
                                                  size: 14.0,
                                                  color: AppColor.black1C2030,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  )
                                : const SizedBox(height: 0),
                          ],
                        );
                      },
                    ),
            ],
          );
        },
      ),
    );
  }
}
