import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pocketbook/core/services/language_services.dart';
import 'package:pocketbook/utils/app_constant.dart';

extension FormatDate on DateTime {
  String format(String formater) {
    final LanguageService languageService = Get.find();
    DateFormat dateFormat = DateFormat(formater, languageService.localeString);
    return dateFormat.format(this);
  }

  bool get isCurrentMonth {
    final DateTime now = DateTime.now();

    return year == now.year && month == now.month;
  }

  bool get isCurrentWeek {
    final DateTime now = DateTime.now();
    final DateTime currentDate = DateTime(now.year, now.month, now.day);
    final startDay =
        currentDate.subtract(Duration(days: currentDate.weekday % 7));
    final endDay = startDay.add(const Duration(days: 7));
    return startDay.isBefore(this) && endDay.isAfter(this);
  }

  bool isDayBefore(DateTime other) {
    final v1 = DateTime(year, month, day);
    final v2 = DateTime(other.year, other.month, other.day);

    /// user [!v1.isAfter(v2)] instead of  [v1.isBefore(v2) || v1.isAtSameMomentAs(v2)]
    return !v1.isAfter(v2);
  }

  String get formatHourAndMinutes {
    DateFormat outputFormat = DateFormat(DateConstant.dateFormatHHmm);
    return outputFormat.format(this);
  }
}

extension ParseString on String {
  DateTime parseString(String formatter) {
    DateFormat dateFormat = DateFormat(formatter);
    return dateFormat.parse(this);
  }

  String get convertPath {
    switch (toLowerCase()) {
      case '.heic':
      case '.heif':
      case '.jpeg':
        return '.jpg';
      default:
        return this;
    }
  }

  bool get isErrorCodeBookingTimePharmacyInvalid {
    return this == ErrorCodeConstant.ee026 ||
        this == ErrorCodeConstant.ee027 ||
        this == ErrorCodeConstant.ee030 ||
        this == ErrorCodeConstant.ee031 ||
        this == ErrorCodeConstant.ee032 ||
        this == ErrorCodeConstant.ee033 ||
        this == ErrorCodeConstant.ee077;
  }
}

extension TimeEx on TimeOfDay {
  /// return positive if this time is after time of other Datetime
  /// return negative if this time is before time of other Datetime
  int compareToDate(DateTime otherDateTime) {
    final otherTime =
        TimeOfDay(hour: otherDateTime.hour, minute: otherDateTime.minute);
    return (toInt - otherTime.toInt);
  }

  int get toInt => hour * 60 + minute;
}
