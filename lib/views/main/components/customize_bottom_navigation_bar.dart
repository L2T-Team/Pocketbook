import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketbook/language/language.dart';
import 'package:pocketbook/utils/app_asset.dart';
import 'package:pocketbook/utils/app_style.dart';
import 'package:pocketbook/views/main/components/bottom_icon.dart';

class CustomizeBottomNavigationBar extends StatelessWidget {
  const CustomizeBottomNavigationBar({
    super.key,
    required this.indexScreen,
    required this.onTap,
  });

  final int indexScreen;
  final Function(int) onTap;
  final _selectedColor = AppColor.pinkEC7590;
  final _unselectedColor = AppColor.grey1E2A3B;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedItemColor: _unselectedColor,
      selectedItemColor: _selectedColor,
      showUnselectedLabels: true,
      backgroundColor: AppColor.white,
      elevation: 0,
      iconSize: 24,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      selectedLabelStyle: _selectedStyle(),
      unselectedLabelStyle: _unSelectedStyle(),
      onTap: indexScreen == 2 ? null : onTap,
      type: BottomNavigationBarType.fixed,
      currentIndex: indexScreen,
      items: _bottomItemList(),
    );
  }

  /// Bottom item list
  List<BottomNavigationBarItem> _bottomItemList() {
    return [
      /// Home
      BottomNavigationBarItem(
        label: LanguageKey.home.tr,
        icon: BottomIcon(
          imageAsset: indexScreen == 0
              ? AppImages.icHomeSelected
              : AppImages.icHomeUnSelected,
          color: _getColor(index: 0),
          lineColor: _selectedColor.withOpacity(indexScreen == 0 ? 1 : 0),
          trueIndex: 0,
        ),
      ),

      /// Report
      BottomNavigationBarItem(
        label: LanguageKey.report.tr,
        icon: BottomIcon(
          imageAsset: indexScreen == 1
              ? AppImages.icReportSelected
              : AppImages.icReportUnSelected,
          color: _getColor(index: 1),
          lineColor: _selectedColor.withOpacity(indexScreen == 1 ? 1 : 0),
          trueIndex: 1,
        ),
      ),

      ///
      const BottomNavigationBarItem(
        label: '',
        icon: SizedBox(
          width: 24,
        ),
      ),

      /// Kid
      BottomNavigationBarItem(
        label: LanguageKey.kid.tr,
        icon: BottomIcon(
          imageAsset: indexScreen == 3
              ? AppImages.icKidSelected
              : AppImages.icKidUnSelected,
          color: _getColor(index: 3),
          lineColor: _selectedColor.withOpacity(indexScreen == 3 ? 1 : 0),
          trueIndex: 3,
        ),
      ),

      /// Setting
      BottomNavigationBarItem(
        label: LanguageKey.setting.tr,
        icon: BottomIcon(
          imageAsset: indexScreen == 4
              ? AppImages.icSettingSelected
              : AppImages.icSettingUnSelected,
          color: _getColor(index: 4),
          lineColor: _selectedColor.withOpacity(indexScreen == 4 ? 1 : 0),
          trueIndex: 4,
        ),
      ),
    ];
  }

  /// Get color by indexScreen
  Color _getColor({required int index}) {
    return indexScreen == index ? _selectedColor : _unselectedColor;
  }

  /// Setting style label bottom navigation bar
  dynamic _selectedStyle() {
    return Get.textTheme.bodySmall?.copyWith(
      fontFamily: NameFont.dMSans,
      fontWeight: FontWeight.w500,
      fontSize: 12.0,
      color: _selectedColor,
    );
  }

  dynamic _unSelectedStyle() {
    return Get.textTheme.bodySmall?.copyWith(
      fontFamily: NameFont.dMSans,
      fontWeight: FontWeight.w400,
      fontSize: 12.0,
      color: _unselectedColor,
    );
  }
}
