import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketbook/utils/app_routes.dart';
import 'package:pocketbook/views/kid/kid_binding.dart';
import 'package:pocketbook/views/kid/kid_view.dart';

class NestedNavigationKid extends StatelessWidget {
  const NestedNavigationKid({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(RoutesName.nestedNavKid),
      initialRoute: "/nestedNavKid",
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case RoutesName.kid:
            return GetPageRoute(
              settings: settings,
              binding: KidBinding(),
              page: () => const KidView(),
            );
          default:
            return GetPageRoute(
              settings: settings,
              binding: KidBinding(),
              page: () => const KidView(),
            );
        }
      },
    );
  }
}
