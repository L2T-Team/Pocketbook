import 'dart:developer';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pocketbook/core/services/language_services.dart';
import 'package:pocketbook/repos/auth_repo.dart';
import 'package:pocketbook/services/api/api.dart';
import 'package:pocketbook/services/local_storage/auth_local_storage.dart';
import 'package:pocketbook/services/local_storage/marketing_local_storage.dart';
import 'package:pocketbook/services/repositories/auth_repo_iml.dart';

class AppServices {
  static Future<void> initServices() async {
    log('Starting services ...', name: 'AppServices');
    await Get.putAsync<SharedPreferences>(() async {
      return await SharedPreferences.getInstance();
    });

    await Get.putAsync(() async {
      return await LanguageService(sharedPreferences: Get.find()).init();
    });

    Get.put<AuthLocalStorage>(AuthLocalStorageIpml(sharedPref: Get.find()));
    Get.put<AuthRepo>(AuthRepoImpl(authLocalStorage: Get.find()));
    Get.put<MarketingLocalStorage>(
        MarketingLocalStorageIpml(sharedPref: Get.find()));
    Get.put<DioApi>(DioApi(authRepo: Get.find()));

    log('All services started! ✅', name: 'AppServices');
  }
}
