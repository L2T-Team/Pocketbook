import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketbook/utils/app_routes.dart';
import 'package:pocketbook/views/setting/widget/logout_popup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pocketbook/repos/auth_repo.dart';

class SettingController extends GetxController {
  AuthRepo authRepo;
  SharedPreferences sharedPreferences;

  SettingController({
    required this.authRepo,
    required this.sharedPreferences,
  });

  /// Init
  @override
  void onInit() {
    super.onInit();
  }

  /// Logout Action
  void logOutAction(BuildContext context) {
    showDialog(
      context: context,
      useSafeArea: false,
      builder: (context) {
        return const LogoutPopup();
      },
    );
  }

  /// Category
  void navigateCategory() {
    Get.toNamed(RoutesName.category);
  }
}
