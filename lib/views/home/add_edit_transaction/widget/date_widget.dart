import 'package:flutter/material.dart';
import 'package:pocketbook/language/language.dart';
import 'package:pocketbook/utils/app_asset.dart';
import 'package:pocketbook/utils/app_helper.dart';
import 'package:pocketbook/utils/app_style.dart';
import 'package:get/get.dart';

class DateWidget extends StatelessWidget {
  final DateTime date;
  final Function nextAction;
  final Function previousAction;
  final double? topPadding;
  final String? type;
  final Function(DateTime) selectedDateAction;
  final String? format;
  const DateWidget({
    super.key,
    required this.date,
    required this.nextAction,
    required this.previousAction,
    this.topPadding,
    this.type,
    this.format,
    required this.selectedDateAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: topPadding ?? 16.0,
      ),
      child: Row(
        children: [
          /// Date
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              format != null
                  ? AppHelper.convertDatetoStringWithFormat(date, format!)
                  : AppHelper.checkDateShow(
                      AppHelper.convertDateTimeMMddYYYY(date),
                      type: type,
                    ),
              textAlign: TextAlign.left,
              style: TextStyles.mediumTextStyle(
                size: 14.0,
                color: AppColor.black1C2030,
              ),
            ),
          ),

          /// Calendar
          Container(
            margin: const EdgeInsets.only(left: 8.0),
            width: 20.0,
            height: 20.0,
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: format != null
                  ? null
                  : () {
                      showDatePicker(
                        context: context,
                        initialDate: date,
                        firstDate: DateTime(1950),
                        lastDate: DateTime(2050),
                        builder: (context, child) {
                          return Localizations(
                            locale: const Locale('en'),
                            delegates: const <LocalizationsDelegate<dynamic>>[
                              DefaultWidgetsLocalizations.delegate,
                              DefaultMaterialLocalizations.delegate,
                            ],
                            child: MediaQuery(
                              data: const MediaQueryData(),
                              child: Theme(
                                data: ThemeData.light().copyWith(
                                  primaryColor: AppColor.pinkF27781,
                                  hintColor: AppColor.pinkEB3B6A,
                                  colorScheme: const ColorScheme.light(
                                    primary: AppColor.pinkF27781,
                                  ),
                                  buttonTheme: const ButtonThemeData(
                                    textTheme: ButtonTextTheme.primary,
                                  ),
                                ),
                                child: child!,
                              ),
                            ),
                          );
                        },
                      ).then((pickedDate) {
                        if (pickedDate != null) {
                          selectedDateAction(pickedDate);
                        }
                      });
                    },
              child: Image.asset(
                AppImages.icCalendar,
                width: 20.0,
                height: 20.0,
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// Spacing
          const Expanded(child: SizedBox()),

          type == LanguageKey.period.tr
              ? const SizedBox()
              : Row(
                  children: [
                    /// Previous
                    Container(
                      width: 20.0,
                      height: 20.0,
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () {
                          previousAction();
                        },
                        child: Image.asset(
                          AppImages.icPrevious,
                          width: 20.0,
                          height: 20.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 8.0),
                      width: 20.0,
                      height: 20.0,
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () {
                          nextAction();
                        },
                        child: Image.asset(
                          AppImages.icNext,
                          width: 20.0,
                          height: 20.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
