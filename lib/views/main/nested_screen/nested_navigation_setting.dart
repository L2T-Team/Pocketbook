import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketbook/utils/app_routes.dart';
import 'package:pocketbook/views/setting/setting_binding.dart';
import 'package:pocketbook/views/setting/setting_view.dart';

class NestedNavigationSetting extends StatelessWidget {
  const NestedNavigationSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(RoutesName.setting),
      initialRoute: "/nestedNavSetting",
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case RoutesName.setting:
            return GetPageRoute(
              settings: settings,
              binding: SettingBinding(),
              page: () => const SettingView(),
            );
          default:
            return GetPageRoute(
              settings: settings,
              binding: SettingBinding(),
              page: () => const SettingView(),
            );
        }
      },
    );
  }
}
