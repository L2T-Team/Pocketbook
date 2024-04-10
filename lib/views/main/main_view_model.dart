import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketbook/views/main/nested_screen/nested_navigation_kid.dart';
import 'package:pocketbook/views/main/nested_screen/nested_navigation_report.dart';
import 'package:pocketbook/views/main/nested_screen/nested_navigation_home.dart';
import 'package:pocketbook/views/main/nested_screen/nested_navigation_setting.dart';

class MainViewModel extends GetxController {
  RxInt indexScreen = RxInt(0);
  Rx<int> indexTour = Rx<int>(0);

  void changeInsexScreen(int index) {
    indexScreen.value = index;
  }

  /// Define
  List<Widget> listScreen() {
    return [
      const NestedNavigationHome(),
      const NestedNavigationReport(),
      const SizedBox(),
      const NestedNavigationKid(),
      const NestedNavigationSetting(),
    ];
  }

  /// Change screen
  void changeScreen(int index) {
    if (index == 2) {
      return;
    }
    indexScreen(index);
  }
}
