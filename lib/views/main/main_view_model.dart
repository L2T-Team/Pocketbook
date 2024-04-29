import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketbook/my_app.dart';
import 'package:pocketbook/utils/app_constant.dart';
import 'package:pocketbook/utils/app_helper.dart';
import 'package:pocketbook/views/main/nested_screen/nested_navigation_kid.dart';
import 'package:pocketbook/views/main/nested_screen/nested_navigation_report.dart';
import 'package:pocketbook/views/main/nested_screen/nested_navigation_home.dart';
import 'package:pocketbook/views/main/nested_screen/nested_navigation_setting.dart';

class MainViewModel extends GetxController {
  RxInt indexScreen = RxInt(0);
  Rx<int> indexTour = Rx<int>(0);
  StreamSubscription? subscription;

  /// Init
  @override
  void onInit() {
    super.onInit();
    subscription = eventBus.on().listen((event) {
      if (event == EventConstant.navigateHomeEvent) {
        changeInsexScreen(0);
      } else if (event == EventConstant.navigateMeEvent) {
        changeInsexScreen(4);
      }
    });
  }

  /// On Ready
  @override
  void onReady() {
    super.onReady();
    AppHelper.checkAuthorization();
  }

  /// Dispose
  @override
  void dispose() {
    super.dispose();
    subscription?.cancel();
  }

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
