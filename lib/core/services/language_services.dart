import 'package:easy_debounce/easy_debounce.dart';
import '../../utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageService extends GetxService {
  LanguageService({
    required this.sharedPreferences,
  });

  final SharedPreferences sharedPreferences;
  var locale = LocaleConstants.ja.obs;

  Locale get currentLocale => locale.value;
  String get localeString =>
      '${currentLocale.languageCode}_${currentLocale.countryCode!.toUpperCase()}';

  Future<LanguageService> init() async {
    await initLocalLanguage();
    return this;
  }

  /// save locale if don't have
  Future<void> initLocalLanguage() async {
    String? currentLanguageStore =
        sharedPreferences.getString(AppConstant.sharePrefKeys.language);
    String? currentCountryStore =
        sharedPreferences.getString(AppConstant.sharePrefKeys.countryCode);
    if ((currentLanguageStore?.isEmpty ?? true) ||
        (currentCountryStore?.isEmpty ?? true)) {
      await setDefaultLocale(LocaleConstants.ja);
    } else {
      locale.value = Locale(currentLanguageStore!, currentLanguageStore);
    }
  }

  setDefaultLocale(Locale newLocale) async {
    await sharedPreferences.setString(
        AppConstant.sharePrefKeys.language, newLocale.languageCode);
    await sharedPreferences.setString(
        AppConstant.sharePrefKeys.countryCode, newLocale.countryCode ?? '');

    locale.value = newLocale;
  }

  Future<void> updateLanguage(Locale newLocale) async {
    EasyDebounce.debounce('my-debouncer', const Duration(seconds: 2), () async {
      await sharedPreferences.setString(
          AppConstant.sharePrefKeys.language, newLocale.languageCode);
      await sharedPreferences.setString(
          AppConstant.sharePrefKeys.countryCode, newLocale.countryCode ?? '');
    });

    locale.value = newLocale;
    Get.updateLocale(newLocale);
  }
}
