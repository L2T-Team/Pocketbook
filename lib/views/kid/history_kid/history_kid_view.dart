import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketbook/language/language.dart';
import 'package:pocketbook/utils/app_style.dart';
import 'package:pocketbook/views/kid/history_kid/history_kid_controller.dart';
import 'package:pocketbook/views/kid/history_kid/widget/history_year_widget.dart';
import 'package:pocketbook/views/setting/widget/header_widget.dart';

class HistoryKidView extends GetWidget<HistoryKidController> {
  const HistoryKidView({super.key});

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
              title: LanguageKey.history.tr,
            ),

            /// Body
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    /// Year
                    Obx(
                      () => HistoryYearWidget(
                        listKids: controller.listKids.value,
                        year: 2024,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
