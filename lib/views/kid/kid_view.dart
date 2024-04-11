import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketbook/language/language.dart';
import 'package:pocketbook/utils/app_style.dart';
import 'package:pocketbook/views/kid/kid_controller.dart';
import 'package:pocketbook/views/kid/widget/calendar_widget.dart';
import 'package:pocketbook/views/setting/widget/header_widget.dart';

class KidView extends GetWidget<KidController> {
  const KidView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.greyFEF6FA,
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            /// Header
            HeaderWidget(
              title: LanguageKey.captureKidCare.tr,
              isHiddenBack: true,
            ),

            /// Body
            Expanded(
              child: Column(
                children: [
                  /// Calendar
                  CalendarWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
