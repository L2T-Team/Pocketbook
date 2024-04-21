import 'package:pocketbook/utils/app_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class MarketingLocalStorage {
  bool? getIsSendInstallAppEvent();
  Future<bool> saveIsSendDownloadAppEvent(bool isSendInstallAppEvent);
  bool? getIsSendFirstOpenAppEvent();
  Future<bool> saveIsSendFirstOpenAppEvent(bool isSendFirstOpenAppEvent);
  DateTime? getFirstOpenApp();
  Future<bool> saveFirstOpenApp(DateTime time);
  String? getEmployeeAccessTopScreen();
  Future<bool> saveEmployeeAccessTopScreen(String employeeId);

  List<String> getListEmployeeNumberEvent(String key);
  Future<bool> saveListEmployeeNumberEvent(
    String key,
    List<String> listEmployee,
  );
}

// with shared pref
class MarketingLocalStorageIpml implements MarketingLocalStorage {
  SharedPreferences sharedPref;

  MarketingLocalStorageIpml({required this.sharedPref});

  @override
  bool? getIsSendInstallAppEvent() {
    try {
      return sharedPref.getBool(
        AppConstant.sharePrefKeys.isSendInstallAppEvent,
      );
    } catch (_) {
      return null;
    }
  }

  @override
  Future<bool> saveIsSendDownloadAppEvent(bool isSendInstallAppEvent) async {
    try {
      return await sharedPref.setBool(
        AppConstant.sharePrefKeys.isSendInstallAppEvent,
        isSendInstallAppEvent,
      );
    } catch (e) {
      return false;
    }
  }

  @override
  DateTime? getFirstOpenApp() {
    try {
      var data = sharedPref.getInt(
        AppConstant.sharePrefKeys.firstOpenApp,
      );
      if (data == null) return null;
      return DateTime.fromMillisecondsSinceEpoch(data);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<bool> saveFirstOpenApp(DateTime time) async {
    try {
      return await sharedPref.setInt(
        AppConstant.sharePrefKeys.firstOpenApp,
        time.millisecondsSinceEpoch,
      );
    } catch (e) {
      return false;
    }
  }

  @override
  bool? getIsSendFirstOpenAppEvent() {
    try {
      return sharedPref.getBool(
        AppConstant.sharePrefKeys.isSendFirstOpenAppEvent,
      );
    } catch (_) {
      return null;
    }
  }

  @override
  Future<bool> saveIsSendFirstOpenAppEvent(bool isSendFirstOpenAppEvent) async {
    try {
      return await sharedPref.setBool(
        AppConstant.sharePrefKeys.isSendFirstOpenAppEvent,
        isSendFirstOpenAppEvent,
      );
    } catch (e) {
      return false;
    }
  }

  @override
  String? getEmployeeAccessTopScreen() {
    try {
      return sharedPref.getString(
        AppConstant.sharePrefKeys.employeeAccessTopScreen,
      );
    } catch (_) {
      return null;
    }
  }

  @override
  Future<bool> saveEmployeeAccessTopScreen(String employeeId) async {
    try {
      return await sharedPref.setString(
        AppConstant.sharePrefKeys.employeeAccessTopScreen,
        employeeId,
      );
    } catch (e) {
      return false;
    }
  }

  @override
  List<String> getListEmployeeNumberEvent(String key) =>
      sharedPref.getStringList(key) ?? [];

  @override
  Future<bool> saveListEmployeeNumberEvent(
          String key, List<String> listEmployee) async =>
      sharedPref.setStringList(
        key,
        listEmployee,
      );
}
