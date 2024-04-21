import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketbook/utils/app_asset.dart';
import 'package:pocketbook/utils/app_routes.dart';
import 'package:pocketbook/views/main/components/customize_bottom_navigation_bar.dart';
import 'package:pocketbook/views/main/main_view_model.dart';

class MainView extends GetWidget<MainViewModel> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool value) {},
      child: Stack(
        children: [
          Obx(
            () => Scaffold(
              body: IndexedStack(
                index: controller.indexScreen.value,
                children: controller.listScreen(),
              ),
              bottomNavigationBar: Theme(
                data: ThemeData(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                child: CustomizeBottomNavigationBar(
                  indexScreen: controller.indexScreen.value,
                  onTap: controller.changeScreen,
                ),
              ),
              floatingActionButton: Container(
                margin: const EdgeInsets.only(top: 30),
                alignment: Alignment.center,
                width: 48,
                height: 48,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24.0),
                  child: FloatingActionButton(
                    onPressed: () {
                      /// Add Transaction
                      Get.toNamed(
                        RoutesName.addEditTransaction,
                      );
                    },
                    child: Image.asset(
                      AppImages.icAddButton,
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
            ),
          ),
        ],
      ),
    );
  }
}
