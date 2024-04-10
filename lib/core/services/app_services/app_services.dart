import 'dart:developer';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../language_services.dart';

class AppServices {
  static Future<void> initServices() async {
    log('Starting app services ...', name: 'AppServices');
    await Get.putAsync<SharedPreferences>(() async {
      return await SharedPreferences.getInstance();
    });
    await Get.putAsync(() async {
      return await LanguageService(sharedPreferences: Get.find()).init();
    });
    log('All app services started! ✅', name: 'AppServices');
  }
}
