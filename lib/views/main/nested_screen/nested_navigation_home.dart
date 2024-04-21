import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketbook/utils/app_routes.dart';
import 'package:pocketbook/views/home/home_binding.dart';
import 'package:pocketbook/views/home/home_view.dart';

class NestedNavigationHome extends StatelessWidget {
  const NestedNavigationHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(RoutesName.nestedNavHome),
      initialRoute: "/nestedNavHome",
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case RoutesName.home:
            return GetPageRoute(
              settings: settings,
              binding: HomeBinding(),
              page: () => const HomeView(),
            );
          default:
            return GetPageRoute(
              settings: settings,
              binding: HomeBinding(),
              page: () => const HomeView(),
            );
        }
      },
    );
  }
}
