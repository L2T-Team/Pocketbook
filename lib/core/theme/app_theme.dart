import 'package:flutter/material.dart';
import 'package:pocketbook/utils/app_style.dart';

class AppThemes {
  AppThemes._();

  ///light theme
  static final ThemeData lightTheme = ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        elevation: MaterialStateProperty.all<double>(0),
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return AppColor.blue043D8C.withOpacity(0.4);
            }
            return AppColor.blue043D8C;
          },
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color?>(
          (_) => AppColor.white,
        ),
        textStyle: MaterialStateProperty.resolveWith<TextStyle?>(
          (_) => TextStyles.normalTextStyle(
            color: AppColor.white,
            size: 17,
            fontFamily: NameFont.dMSans,
          ),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(style: ButtonStyle(
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColor.greyAAA69F;
          }
          return AppColor.blue043D8C;
        },
      ),
    )),
    fontFamily: NameFont.dMSans,
    datePickerTheme: DatePickerThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13),
      ),
      elevation: 2,
      shadowColor: AppColor.black.withOpacity(.3),
      weekdayStyle: TextStyles.semiBoldTextStyle(
        color: AppColor.color3C3C43.withOpacity(.3),
        size: 13,
        fontFamily: NameFont.dMSans,
      ),
      dayStyle: TextStyles.lightTextStyle(
        size: 20,
        color: AppColor.black,
        fontFamily: NameFont.dMSans,
        height: 1.25,
      ),
      yearBackgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.selected)) {
            return AppColor.blue043D8C;
          }
          return AppColor.transparent;
        },
      ),
      yearForegroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.selected)) {
            return AppColor.white;
          }
          return AppColor.black;
        },
      ),
      dayBackgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColor.blue043D8C;
        }
        return Colors.transparent;
      }),
      dayOverlayColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return AppColor.transparent;
        }
        if (states.contains(MaterialState.hovered)) {
          return AppColor.greyEBEBEB;
        }
        if (states.contains(MaterialState.pressed)) {
          return AppColor.greyC8C8C8;
        }
        return AppColor.blue043D8C;
      }),
      todayBorder: BorderSide.none,
      backgroundColor: AppColor.white,
      todayBackgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColor.blue043D8C;
        }
        return AppColor.transparent;
      }),
      todayForegroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColor.white;
        }
        return AppColor.black;
      }),
      headerBackgroundColor: AppColor.blue043D8C,
    ),
  );

  //the dark theme
  static final ThemeData darkTheme = ThemeData(
    fontFamily: NameFont.dMSans,
  );
}
