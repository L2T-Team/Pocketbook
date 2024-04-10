import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketbook/utils/app_routes.dart';
import 'package:pocketbook/views/report/report_binding.dart';
import 'package:pocketbook/views/report/report_view.dart';

class NestedNavigationReport extends StatelessWidget {
  const NestedNavigationReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(RoutesName.nestedNavReport),
      initialRoute: "/nestedNavReport",
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case RoutesName.report:
            return GetPageRoute(
              settings: settings,
              binding: ReportBinding(),
              page: () => const ReportView(),
            );
          default:
            return GetPageRoute(
              settings: settings,
              binding: ReportBinding(),
              page: () => const ReportView(),
            );
        }
      },
    );
  }
}
