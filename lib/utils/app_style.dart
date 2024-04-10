import 'package:flutter/cupertino.dart';

class NameFont {
  static const dMSans = 'DMSans';
}

class TextStyles {
  static TextStyle extraBoldTextStyle(
          {double? size,
          Color? color,
          double height = 1.0,
          String fontFamily = NameFont.dMSans}) =>
      TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w800,
        color: color,
        height: height,
        fontFamily: fontFamily,
      );

  static TextStyle boldTextStyle(
          {double? size,
          Color? color,
          double height = 1.0,
          String fontFamily = NameFont.dMSans}) =>
      TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w700,
        color: color,
        height: height,
        fontFamily: fontFamily,
      );

  static TextStyle semiBoldTextStyle(
          {double? size,
          Color? color,
          double height = 1.0,
          String fontFamily = NameFont.dMSans}) =>
      TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w600,
        color: color,
        height: height,
        fontFamily: fontFamily,
      );

  static TextStyle normalTextStyle(
          {double? size,
          Color? color,
          double height = 1.0,
          String fontFamily = NameFont.dMSans}) =>
      TextStyle(
        fontSize: size,
        fontWeight: FontWeight.normal,
        color: color,
        height: height,
        fontFamily: fontFamily,
      );

  static TextStyle lightTextStyle(
          {double? size,
          Color? color,
          double height = 1.0,
          String fontFamily = NameFont.dMSans}) =>
      TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w300,
        color: color,
        height: height,
        fontFamily: fontFamily,
      );

  static TextStyle mediumTextStyle(
          {double? size,
          Color? color,
          double height = 1.0,
          String fontFamily = NameFont.dMSans}) =>
      TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w500,
        color: color,
        height: height,
        fontFamily: fontFamily,
      );
}

class AppColor {
  static const Color primary = Color(0xFF086E6B);
  static const Color white = Color(0xFFFFFFFF);
  static const Color background = Color(0xFFF5F5F5);
  static const Color grey = Color(0xFF1C1C1E);
  static const Color transparent = Color(0x00000000);
  static const Color grey333333 = Color(0xFF333333);
  static const Color grey8C8C8C = Color(0xFF8C8C8C);
  static const Color greyC7C7C7 = Color(0xFFC7C7C7);
  static const Color greyC7C7CC = Color(0xFFC7C7CC);
  static const Color blue043D8C = Color(0xFF043D8C);
  static const Color black = Color(0xFF000000);
  static const Color greyAAA69F = Color(0xFFAAA69F);
  static const Color color3C3C43 = Color(0xFF3C3C43);
  static const Color greyEBEBEB = Color(0xFFEBEBEB);
  static const Color greyC8C8C8 = Color(0xFFC8C8C8);
  static const Color greyDCDCDC = Color(0xFFDCDCDC);
  static const Color greyF8F7F6 = Color(0xFFF8F7F6);

  static const Color black201913 = Color(0xFF201913);
  static const Color pinkEB3B6A = Color(0xFFEB3B6A);
  static const Color grey575757 = Color(0xFF575757);
  static const Color greyFFE2EA = Color(0xFFFFE2EA);
  static const Color blue1877F2 = Color(0xFF1877F2);
  static const Color pinkD63660 = Color(0xFFD63660);
  static const Color grey282828 = Color(0xFF282828);
  static const Color greyEFEFEF = Color(0xFFEFEFEF);
  static const Color grey201913 = Color(0xFF201913);
  static const Color grey4E4C49 = Color(0xFF4E4C49);
  static const Color greyE5E5E5 = Color(0xFFE5E5E5);
  static const Color greyFEF6FA = Color(0xFFFEF6FA);
  static const Color pinkF27781 = Color(0xFFF27781);
  static const Color pinkEC7590 = Color(0xFFEC7590);
  static const Color pinkF2A0C6 = Color(0xFFF2A0C6);
  static const Color black1C2030 = Color(0xFF1C2030);
  static const Color greyC5C8D4 = Color(0xFFC5C8D4);
  static const Color grey1E2A3B = Color(0xFF1E2A3B);
  static const Color greyECEDF1 = Color(0xFFECEDF1);
  static const Color redE91C2B = Color(0xFFE91C2B);
  static const Color grey434D73 = Color(0xFF434D73);
  static const Color grey007AFF = Color(0xFF007AFF);
  static const Color green10B981 = Color(0xFF10B981);
  static const Color redEF4444 = Color(0xFFEF4444);
}
