import 'package:flutter/material.dart';

class LocaleConstants {
  static const Locale ja = Locale(LocaleKey.ja, CountryKey.ja);
  static const Locale en = Locale(LocaleKey.en, CountryKey.us);
}

class LocaleKey {
  static const String en = "en";
  static const String ja = "ja";
}

class CountryKey {
  static const String us = "US";
  static const String ja = "JA";
}

class ZipcodeIP {
  static const String production = "https://adsearch-api.kuronekoyamato.co.jp";
  static const String develop = "https://com-dev03.kuronekoyamato.co.jp";
}

class DateConstant {
  static const String dateMMMM = 'MMMM';
  static const String dateMMddYYYY = 'MM/dd/yyyy';
  static const String dateYYYY = 'yyyy';
  static const String dateMMYYYY = 'MMMM yyyy';
  static const String dateMMMYYYY = 'MMM yyyy';
  static const String dateFormatyyyyMMddEEE = 'yyyy/MM/dd(EEE)';
  static const String dateFormatyyyyMMdd2 = 'yyyyMMdd';
  static const String dateFormatyyyyMdE = 'yyyy/M/d(E)';
  static const String dateFormatyMd = 'y年M月d日';
  static const String dateFormatyMMMM = 'yMMMM';
  static const String dateFormatyyyyMMdd = 'yyyy-MM-dd';
  static const String dateFormatHHmm = 'HH:mm';
  static const String dateFormatyyyyMMddHHmm = 'yyyy-MM-dd HH:mm';
  static const String dateFormatyyyyMMddHHmWithSplash = 'yyyy/MM/dd H:mm';
  static const String dateFormatMdEHHmm = 'M/d(E) HH:mm';
  static const String dateFormatyyyyMdEHHmm = 'yyyy/MM/dd(E) HH:mm-';
  static const String dateFormatyyyyMdEHHmmV2 = 'yyyy/M/dE HH:mm';
  static const String dateFormatyyyyMMddWithSplash = 'yyyy/MM/dd';
  static const String dateFormatMMyy = 'MM/yy';
  static const String dateFormatGoogleCalendar = 'yyyyMMdd\'T\'HHmmss';
  static const String dateFormatOutLookCalendar = 'yyyy-MM-dd\'T\'HH:mm:ss';
  static const String dateFormatMMdd = 'MM/dd';
  static const String dateFormatyyyyMMddEHHmm = 'yyyy/MM/dd(E) HH:mm';

  /// set the time before the meeting time start to user can go to waiting room
  /// unit: minute
  static const int timeBeforeGoWaitingView = 15;
}

class RegexConstant {
  static RegExp uppercaseRegex = RegExp(r'(?=.*[A-Z])');
  static RegExp lowercaseRegex = RegExp('(?=.*[a-z])');
  static RegExp numberRegex = RegExp(r'(?=.*\d)');
  static RegExp specialLetterRegex = RegExp(r'(?=.*[!#$%&*+-./=?@^_`{|}])');
  static RegExp otherSpecialLetterRegex = RegExp(
    r'[^\w\s!#$%&*+\-./=?@^_`{|}]',
  );
  static RegExp allSpecialLetterRegex = RegExp(
      r'''[^\w\s\u4E00-\u9FFF\u3040-\u309F\u30A0-\u30FF\u2160-\u217F]''');
  static RegExp passwordRegex = RegExp(
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*()\-_=+{};:,<.>。・：ー？’]).*$');
  static RegExp loginPasswordRegex = RegExp(
      r'''^(?:(?=.*[A-Z])(?=.*[a-z])(?=.*\d)|(?=.*[A-Z])(?=.*[a-z])(?=.*[\W_])|(?=.*[A-Z])(?=.*\d)(?=.*[\W_])|(?=.*[a-z])(?=.*\d)(?=.*[\W_])).+$''');
  static RegExp emailRegex =
      RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
  static RegExp customEmailRegex = RegExp(
      r'''^[0-9A-Za-z!#$%&\'*+\-./=?^_`{|}~]+@[0-9A-Za-z_-]+(\.[A-Za-z]+)+$''');
  static RegExp postalCodeRegex = RegExp(r'^\d{3}(-)?\d{4}$');
  static RegExp phoneRegex = RegExp(r'^(070|080|090)\d{8}$');
  static RegExp regexCompany = RegExp(r'^[a-zA-Z0-9]{0,20}$');
  static RegExp regexEmployee = RegExp(r'^\d{8}$');
  static RegExp creditCardRegex = RegExp(r'\d{4}');
  static RegExp haftWidthKatakana = RegExp(r'[ｧ-ﾝﾞﾟ]');
  static RegExp nameKanjiRegex = RegExp(
      r'''^([\u3000-\u3003]|[\u3005-\u3015]|[\u3041-\u3093]|[\u309B-\u309E]|[\u30A1-\u30FE]|[\uFF01]|[\uFF03-\uFF06]|[\uFF08-\uFF5E]|[\u4E00-\u9FAF]|[\u2160-\u2179]|[\uFA1D-\uFA1E]|[\uFA1A-\uFA1B]|[\uFA11]|[\u0391-\u03A9]|[\u03B1-\u03C9]|[\u0410-\u044F]|[\u2500-\u253C]|[\uFFE0-\uFFE3]|[\uFFE5]|[\u00B4]|[\u00A7-\u00A8]|[\u2010]|[\u2225]|[\u2025-\u2026]|[\u2018-\u2019]|[\u201C-\u201D]|[\u00D7]|[\u00F7]|[\u2260-\u2261]|[\u2266-\u2267]|[\u221D-\u221E]|[\u2234-\u2235]|[\u2642]|[\u2640]|[\u00B0-\u00B1]|[\u2032-\u2033]|[\u2103]|[\u2605-\u2606]|[\u25CB]|[\u25CE-\u25CF]|[\u25C6-\u25C7]|[\u25A0-\u25A1]|[\u25B2-\u25B3]|[\u25BC-\u25BD]|[\u203B]|[\u2190-\u2193]|[\u2207-\u2208]|[\u220B]|[\u2286-\u2287]|[\u2282-\u2283]|[\u2227-\u222C]|[\u21D2]|[\u21D4]|[\u2200]|[\u2202-\u2203]|[\u2220]|[\u2312]|[\u22A5]|[\u2252]|[\u226A-\u226B]|[\u221A]|[\u223D]|[\u212B]|[\u2030]|[\u266A]|[\u266D]|[\u266F]|[\u2020-\u2021]|[\u00B6]|[\u25EF]|[\u0401]|[\u0451]|[\u254B]|[\u2542]|[\u253F]|[\u3231-\u3232])*$''');
  static RegExp nameKanaRegex = RegExp(
      r'''^([\u3000-\u3002]|[\u30A0-\u30FC]|[\uFF01]|[\uFF1A-\uFF20]|[\u309B-\u309C]|[\uFF3D-\uFF3F]|[\u2015]|[\uFF5B-\uFF5E]|[\u2019]|[\u201D]|[\uFF08-\uFF0F]|[\uFF3B]|[\u300C-\u300D]|[\uFFE5]|[\uFF03-\uFF06])*$''');
  static RegExp addressRegex = RegExp(
      r'''^([\u0020-\u007E\u3000-\u303F\u3040-\u309F\u30A0-\u30FF\uFF01-\uFF5E\u4E00-\u9FAF\u3400-\u4DBF\u2160-\u2188])*$''');
  static RegExp addressIssueRegex = RegExp(r'''^[0-9]{1,5}$''');
}

class StringConstant {
  static const String kanjiFNamePlaceHolder = '白瀬';
  static const String kanjiLNamePlaceHolder = '剛志';
  static const String katakanaFNamePlaceHolder = 'シロセ';
  static const String katakanaLNamePlaceHolder = 'ツヨシ';
  static const String dobPlaceHolder = 'YYYY年MM月DD日';
  static const String postalCodePlaceHolder = 'ハイフンなし７桁';
  static const String prefecturePlaceHolder = '東京都';
  static const String municipalityPlaceHolder = '渋谷区';
  static const String townAndAddressPlaceHolder = '元代々木町5-15-3';
  static const String buildingPlaceHolder = 'メゾン元代々木602';
  static const String receivedAddressPlaceHolder = '元代々木町40-8';
  static const String phonePlaceHolder = 'ハイフンなしで携帯電話番号を入力';
  static const String otpWrong = 'record not found';
  static const String otpExpired = 'verify code is expired';
  static const String expiredCard = 'Card has expired';
}

// Env file
class EnvFileName {
  static const environment = ".env";
}

//Patient type
class PatientTypeNotification {
  static const hospital = "hospital";
  static const parmacity = "parmacity";
}

class SharePrefKeys {
  final String language = "language";
  final String countryCode = "country_code";
  final String refreshToken = 'refreshToken';
  final String authToken = 'authToken';
  final String onBoarding = 'onBoarding';
  final String isLogin = 'is_login';
  final String fcmDeviceToken = 'fcm_token';
  final String deviceID = 'device_id';
  final String fcmExpiredTime = 'fcm_expired_time';
  final String calendarGrant = 'calendar_grant';
  final String autoCancelDialogReadID = 'autoCancelDialogReadID';
  final String isSendInstallAppEvent = 'is_send_install_app_event';
  final String isSendFirstOpenAppEvent = 'is_send_first_open_app_event';
  final String firstOpenApp = 'first_open_app';
  final String employeeAccessTopScreen = 'employee_access_top_screen';
  final String listEmployeeInstallAppEvent = 'list_employee_install_app_event';
  final String listEmployeeFirstOpenAppEvent =
      'list_employee_first_open_app_event';
  final String listEmployeeFirstOpenTopEvent =
      'list_employee_first_open_top_event';
}

class FirebaseConfigKey {
  final String appLinks = "app_links";
  final String iosVersion = 'app_version_ios';
  final String androidVersion = 'app_version_android';
  final String stagingAPIUrl = 'stagingAPIUrl';
  final String stagingAPISocket = 'stagingAPISocket';
  final String linkCHPlay = 'linkCHPlay';
}

/// Event Constant
class EventConstant {
  static const String categoryEvent = 'category_event';
  static const String transactionEvent = 'transaction_event';
  static const String navigateHomeEvent = 'navigate_home_event';
  static const String navigateMeEvent = 'navigate_me_event';
  static const String updateAvatarEvent = 'update_avatar_event';
  
}

/// CollectionConstant
class CollectionConstant {
  static const String user = 'User';
  static const String category = 'Category';
  static const String transaction = 'Transaction';
  static const String kidConfirm = 'Kid-Confirm';
  static const String avatar = 'Avatar';
  static const String username = 'User-Name';
}

/// AppConstant
class AppConstant {
  static SharePrefKeys sharePrefKeys = SharePrefKeys();
  static LocaleKey localeKey = LocaleKey();
  static LocaleConstants localeConstants = LocaleConstants();
  static FirebaseConfigKey firebaseConfig = FirebaseConfigKey();
  static const linkCHPlayGoogleCal =
      'https://play.google.com/store/apps/details?id=com.google.android.calendar';
  static const linkCHPlayOutlookCal =
      'https://play.google.com/store/apps/details?id=com.microsoft.office.outlook';
  static const linkAppStoreGoogleCal =
      'https://apps.apple.com/app/google-calendar/id909319292';
  static const linkAppStoreOutlookCal =
      'https://apps.apple.com/app/outlook/id951937596';

  static const linkCHPlay = 'https://play.google.com/store/apps/details?id=';

  // link to IOS
  static const stagingTestflightLink =
      'https://testflight.apple.com/join/523mNE7S';
  static const prodTestflightLink =
      'https://testflight.apple.com/join/dSLI6UCK';
  static const prodCustomerTestflightLink =
      'https://testflight.apple.com/join/lFr5LVrX';
  static const prodAppleStoreLink = 'https://apps.apple.com/app/id6469021487';
  static const imageBaseUrl =
      'https://firebasestorage.googleapis.com/v0/b/pocketbook-75861.appspot.com/o/';
}

class MessageTypeWss {
  static int textMessage = 1;
  static int binaryMessage = 2;
  static int connectMessage = 7;
  static int closeMessage = 8;
  static int pingMessage = 9;
  static int pongMessage = 10;
}

class ErrorCodeConstant {
  static const String ee000 = "EE000";
  static const String ee001 = "EE001";
  static const String ee002 = "EE002";
  static const String ee003 = "EE003";
  static const String ee004 = "EE004";
  static const String ee005 = "EE005";
  static const String ee006 = "EE006";
  static const String ee007 = "EE007";
  static const String ee008 = "EE008";
  static const String ee009 = "EE009";
  static const String ee010 = "EE010";
  static const String ee011 = "EE011";
  static const String ee012 = "EE012";
  static const String ee013 = "EE013";
  static const String ee014 = "EE014";
  static const String ee015 = "EE015";
  static const String ee016 = "EE016";
  static const String ee017 = "EE017";
  static const String ee018 = "EE018";
  static const String ee021 = "EE021";
  static const String ee022 = "EE022";
  static const String ee023 = "EE023";
  static const String ee024 = "EE024";
  static const String ee025 = "EE025";
  static const String ee026 = "EE026";
  static const String ee027 = "EE027";
  static const String ee030 = "EE030";
  static const String ee031 = "EE031";
  static const String ee032 = "EE032";
  static const String ee033 = "EE033";
  static const String ee035 = "EE035";
  static const String ee043 = "EE043";
  static const String ee074 = "EE074";
  static const String ee075 = "EE075";
  static const String ee077 = "EE077";
  static const String ee078 = "EE078";
  static const String ee080 = "EE080";
  static const String ee081 = "EE081";
  static const String ee092 = "EE092";
  static const String ee093 = "EE093";
  static const String ee094 = "EE094";
  static const String ee095 = "EE095";
  static const String ee096 = "EE096";
  static const String ee097 = "EE097";
}

class AppointmentStatusConstant {
  static const String done = "done";
  static const String canceling = "canceling";
  static const String canceled = "canceled";
  static const String waiting = "waiting";
  static const String processing = "processing";
  static const String confirmed = "confirmed";
  static const String pending = "pending";
  static const String paid = "paid";
}

class UnitConstant {
  static const int mbSize = 1024;
  static const int kbSize = 1024;
  static const double fractionFileSize = 1000 / 1024;

  static const int maxAllowedDocumentCount = 6;

  /*
  1 MB = 1 * (1000 * 1000) / (1024 * 1024) MiB
  10 MB = 10 * maxSizeUploadFilePerFile MiB
  */
  static const double mbToMibBytes =
      mbSize * kbSize * fractionFileSize * fractionFileSize;
}

class NumberConstant {
  static const int maxItemRowZipCodeShow = 3;
}

class AppLinkConstant {
  static const String termLink = "https://www2.mymedica.jp/legal/";
  static const String privacyLink = "https://www2.mymedica.jp/privacy/";
  static const String transactionsLawLink = "https://www2.mymedica.jp/notice/";
  static const String faqLink = "https://www2.mymedica.jp/mymedica/#07";
}

class AuthLinkConstant {
  static String userName = 'mymedica';
  static String password = 'y0WGYqX';
}
