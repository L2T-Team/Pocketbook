import 'package:pocketbook/core/services/base_local_storage.dart';
import 'package:pocketbook/utils/app_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalStorage implements BaseLocalStorage {
  String? getAuthToken();

  void removeAuthToken();

  Future<bool> saveAuthToken(String authToken);

  Future<bool> saveRefreshToken(String refreshToken);

  String? getRefreshToken();

  Future<bool> handleUnAuthorized();

  bool getIsLogin();

  Future<bool> saveIsLogin(bool isLogin);

  Future<bool> saveFCMToken(String token);

  Future<bool> clearFCMToken();

  bool checkFCMRegister();

  String? getFCMToken();

  Future<bool> saveInitCalendarGrant(bool status);

  bool? getInitCalendarGrant();
}

// with shared pref
class AuthLocalStorageIpml implements AuthLocalStorage {
  SharedPreferences sharedPref;

  AuthLocalStorageIpml({required this.sharedPref});

  @override
  String? getAuthToken() {
    return sharedPref.getString(AppConstant.sharePrefKeys.authToken);
  }

  @override
  void removeAuthToken() {
    sharedPref.remove(AppConstant.sharePrefKeys.authToken);
  }

  @override
  Future<bool> saveAuthToken(String authToken) async {
    return sharedPref.setString(AppConstant.sharePrefKeys.authToken, authToken);
  }

  @override
  Future<bool> saveRefreshToken(String refreshToken) async {
    return sharedPref.setString(
        AppConstant.sharePrefKeys.refreshToken, refreshToken);
  }

  @override
  String? getRefreshToken() {
    return sharedPref.getString(AppConstant.sharePrefKeys.refreshToken) ?? '';
  }

  @override
  Future<bool> handleUnAuthorized() async {
    await sharedPref.remove(AppConstant.sharePrefKeys.authToken);
    await sharedPref.remove(AppConstant.sharePrefKeys.refreshToken);
    await sharedPref.remove(AppConstant.sharePrefKeys.isLogin);
    return true;
  }

  @override
  bool getIsLogin() {
    return sharedPref.getBool(AppConstant.sharePrefKeys.isLogin) ?? false;
  }

  @override
  Future<bool> saveIsLogin(bool isLogin) {
    return sharedPref.setBool(AppConstant.sharePrefKeys.isLogin, isLogin);
  }

  @override
  bool checkFCMRegister() {
    try {
      String? fcmToken = sharedPref.getString(
        AppConstant.sharePrefKeys.fcmDeviceToken,
      );
      return fcmToken?.isNotEmpty == true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> clearFCMToken() async {
    try {
      bool removeOk = await sharedPref.remove(
        AppConstant.sharePrefKeys.fcmDeviceToken,
      );
      return removeOk;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> saveFCMToken(String token) async {
    try {
      bool setOk = await sharedPref.setString(
        AppConstant.sharePrefKeys.fcmDeviceToken,
        token,
      );
      return setOk;
    } catch (e) {
      return false;
    }
  }

  @override
  String? getFCMToken() {
    try {
      String? fcmToken = sharedPref.getString(
        AppConstant.sharePrefKeys.fcmDeviceToken,
      );
      return fcmToken;
    } catch (e) {
      return null;
    }
  }

  @override
  bool? getInitCalendarGrant() {
    try {
      return sharedPref.getBool(
        AppConstant.sharePrefKeys.calendarGrant,
      );
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> saveInitCalendarGrant(bool status) async {
    try {
      return await sharedPref.setBool(
          AppConstant.sharePrefKeys.calendarGrant, status);
    } catch (e) {
      return false;
    }
  }
}
