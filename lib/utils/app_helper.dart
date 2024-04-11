import 'dart:async';
import 'dart:convert';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pocketbook/language/language.dart';
import 'package:pocketbook/widget_components/confirm_dialog.dart';
import 'app_constant.dart';
import 'app_extension.dart';

class AppHelper {
  /// Loading
  static Widget buildLoading(bool isLoading) {
    if (isLoading == true) {
      return Container(
        color: const Color.fromRGBO(40, 42, 62, 0),
        alignment: Alignment.center,
        child: SpinKitCircle(color: Colors.black.withOpacity(0.5)),
      );
    } else {
      return const SizedBox();
    }
  }

  /// Message
  static void showError(String text, {String? title, int? time}) {
    Get.closeAllSnackbars();
    Get.closeCurrentSnackbar().then(
      (_) => Get.snackbar(
        title ?? '', //  title ?? LanguageKey.error.tr,
        text,
        duration: Duration(seconds: time ?? 3),
        colorText: Colors.white,
        backgroundColor: (title ?? '').toLowerCase().contains('success')
            ? Colors.green
            : Colors.black.withOpacity(0.5),
        animationDuration: const Duration(milliseconds: 400),
      ),
    );
  }

  static Future<int> checkFilePath(String path) async {
    try {
      final file = File(path);
      return await file.length();
    } catch (e) {
      return -1;
    }
  }

  static bool checkASCII(String password) {
    try {
      for (var element in password.characters) {
        const AsciiEncoder().convert(element);
      }
    } catch (_) {
      return false;
    }
    return true;
  }

  static bool checkPasswordVailidation(String value) {
    if (value.contains('\'') || value.contains('‘')) return false;
    if (value.contains(' ')) return false;
    if (RegexConstant.otherSpecialLetterRegex.hasMatch(value)) return false;
    int acceptedCount = 0;
    if (RegexConstant.uppercaseRegex.hasMatch(value)) {
      ++acceptedCount;
    }
    if (RegexConstant.lowercaseRegex.hasMatch(value)) {
      ++acceptedCount;
    }
    if (RegexConstant.numberRegex.hasMatch(value)) {
      ++acceptedCount;
    }
    if (RegexConstant.specialLetterRegex.hasMatch(value)) {
      ++acceptedCount;
    }
    if (acceptedCount < 3) {
      return false;
    }
    return true;
  }

  static checkSameMonth(DateTime date1, DateTime date2) {
    return date1.year == date2.year && date1.month == date2.month;
  }

  static String convertDateTime(DateTime dateTime) {
    return dateTime.format(DateConstant.dateFormatyyyyMMdd);
  }

  static String convertDateTimeMMddYYYY(DateTime dateTime) {
    return dateTime.format(DateConstant.dateMMddYYYY);
  }

  static DateTime? convertStringToDateTime(String? date) {
    if (date == null) {
      return null;
    }
    try {
      return DateTime.parse(date);
    } catch (_) {
      return null;
    }
  }

  /// String -> Date
  static DateTime convertStringToDateWithFormat(String date, String format) {
    final fm = DateFormat(format);
    return fm.parse(date);
  }

  /// Date -> String
  static String convertDatetoStringWithFormat(DateTime date, String format) {
    final fm = DateFormat(format);
    return fm.format(date);
  }

  /// Photo permission
  static Future<bool> handleGalleryPermission() async {
    await Permission.photos.request();
    var statusPermissionGallery = await Permission.photos.status;
    if (statusPermissionGallery.isGranted) {
      return true;
    }
    if (!statusPermissionGallery.isGranted) {
      AppHelper.showDialogPermission(
        title: LanguageKey.requestPermission.tr,
        message: LanguageKey.requestPhotoPermission.tr,
      );
    }

    return false;
  }

  /// Camera Permission
  static Future<bool> handleCameraPermission() async {
    await Permission.camera.request();
    var statusPermissionCamera = await Permission.camera.status;
    if (statusPermissionCamera.isGranted) {
      return true;
    }
    if (!statusPermissionCamera.isGranted) {
      AppHelper.showDialogPermission(
        title: LanguageKey.requestPermission.tr,
        message: LanguageKey.requestCameraPermission.tr,
      );
    }
    return false;
  }

  /// Setting System Navigate
  static void showDialogPermission({String title = '', String message = ''}) {
    Get.dialog(
      ConfirmDialog(
        title: title,
        message: message,
        onTap: () async {
          await openAppSettings();
        },
      ),
    );
  }

  /// Pick Image
  static Future<XFile?> pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await ImagePicker().pickImage(
        source: source,
      );
      return pickedFile;
    } catch (e) {
      return null;
    }
  }

  /// Format Number
  static String formatNumber(double value) {
    String format = '';
    if (value < 1000) {
      format = '##0.##';
    } else if (value < 1000000) {
      format = '##0,000.##';
    } else if (value < 1000000000) {
      format = '##0,000,000.##';
    } else if (value < 1000000000000) {
      format = '##0,000,000,000.##';
    } else {
      format = '##0,000,000,000,000.##';
    }
    final formatter = NumberFormat(format).format(value);
    return formatter;
  }

  /// Check Date Show
  static String checkDateShow(String date, {String? type}) {
    final dateShow = AppHelper.convertStringToDateWithFormat(
      date,
      DateConstant.dateMMddYYYY,
    );
    if (type == LanguageKey.month.tr) {
      return AppHelper.convertDatetoStringWithFormat(
        dateShow,
        DateConstant.dateMMYYYY,
      );
    } else if (type == LanguageKey.year.tr) {
      return AppHelper.convertDatetoStringWithFormat(
        dateShow,
        DateConstant.dateYYYY,
      );
    }

    /// Type Date/Period
    final dateNow = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    );
    if (checkTheSameDate(dateNow, dateShow)) {
      return 'Today, $date';
    } else if (checkTheSameDate(
        dateNow, dateShow.subtract(const Duration(days: 1)))) {
      return 'Tomorrow, $date';
    } else if (checkTheSameDate(
        dateNow, dateShow.add(const Duration(days: 1)))) {
      return 'Yesterday, $date';
    }
    return date;
  }

  /// Check same date
  static bool checkTheSameDate(
    DateTime date1,
    DateTime date2,
  ) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  /// Get days in month
  static int daysInMonth(DateTime date) {
    var firstDayThisMonth = DateTime(date.year, date.month, date.day);
    var firstDayNextMonth = DateTime(firstDayThisMonth.year,
        firstDayThisMonth.month + 1, firstDayThisMonth.day);
    return firstDayNextMonth.difference(firstDayThisMonth).inDays;
  }
}
