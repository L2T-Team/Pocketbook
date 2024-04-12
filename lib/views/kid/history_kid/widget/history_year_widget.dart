import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketbook/language/language.dart';
import 'package:pocketbook/model/responses/kid_confirm_model.dart';
import 'package:pocketbook/utils/app_asset.dart';
import 'package:pocketbook/utils/app_constant.dart';
import 'package:pocketbook/utils/app_helper.dart';
import 'package:pocketbook/utils/app_style.dart';

class HistoryYearWidget extends StatefulWidget {
  final List<KidConfirmModel> listKids;
  final int year;
  const HistoryYearWidget({
    super.key,
    required this.listKids,
    required this.year,
  });

  @override
  State<StatefulWidget> createState() {
    return HistoryYearWidgetState();
  }
}

class HistoryYearWidgetState extends State<HistoryYearWidget> {
  List<KidGroupConfirmModel> listMonths = [];

  @override
  void initState() {
    super.initState();
    for (int i = 1; i <= 12; i++) {
      final filter = widget.listKids.where((element) {
        final dateShow = AppHelper.convertStringToDateWithFormat(
          element.date ?? '',
          DateConstant.dateMMddYYYY,
        );
        return dateShow.year == widget.year && dateShow.month == i;
      }).toList();
      listMonths.add(KidGroupConfirmModel(
        isDropdown: false,
        month: i,
        listKids: filter,
      ));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final filterYear = widget.listKids.where((element) {
      final dateShow = AppHelper.convertStringToDateWithFormat(
        element.date ?? '',
        DateConstant.dateMMddYYYY,
      );
      return dateShow.year == widget.year;
    }).toList();
    return Container(
      margin: const EdgeInsets.only(top: 18.0),
      child: Column(
        children: [
          /// Year
          Container(
            height: 44.0,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColor.pinkF27781,
                  AppColor.pinkF2A0C6,
                ],
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  alignment: Alignment.center,
                  child: Image.asset(
                    AppImages.icDropdownWhite,
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
                      '${widget.year} (${filterYear.length})',
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

          /// List
          ListView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: listMonths.length,
            shrinkWrap: true,
            itemBuilder: (conext, indexTr) {
              final group = listMonths[indexTr];
              return Column(
                children: [
                  /// Header Month
                  SizedBox(
                    height: 44.0,
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
                        listMonths[indexTr].isDropdown =
                            !listMonths[indexTr].isDropdown;
                        setState(() {});
                      },
                      child: Container(
                        height: 44.0,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                                margin: const EdgeInsets.only(left: 8.0),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '${AppHelper.convertDatetoStringWithFormat(DateTime(widget.year, group.month, 1), DateConstant.dateMMMM)} (${group.listKids.length})',
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
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: group.listKids.length,
                          shrinkWrap: true,
                          itemBuilder: (conext, index) {
                            final kid = listMonths[indexTr].listKids[index];
                            return Container(
                              height: 48.0,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                children: [
                                  /// Image
                                  Container(
                                    margin: const EdgeInsets.only(right: 16.0),
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
                                        style: TextStyles.mediumTextStyle(
                                          size: 14.0,
                                          color: AppColor.black1C2030,
                                        ),
                                      ),
                                    ),
                                  ),

                                  /// Amount
                                  Container(
                                    alignment: Alignment.centerRight,
                                    margin: const EdgeInsets.only(right: 2),
                                    child: Text(
                                      kid.date ?? '',
                                      textAlign: TextAlign.left,
                                      style: TextStyles.normalTextStyle(
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
      ),
    );
  }
}
