import 'package:flutter/material.dart';
import 'package:pocketbook/language/language.dart';
import 'package:pocketbook/model/responses/kid_confirm_model.dart';
import 'package:get/get.dart';
import 'package:pocketbook/utils/app_asset.dart';
import 'package:pocketbook/utils/app_style.dart';

class HistoryKidWidget extends StatelessWidget {
  final List<KidConfirmModel> listKids;
  final Function viewAllAction;
  const HistoryKidWidget({
    super.key,
    required this.listKids,
    required this.viewAllAction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          /// Header
          Container(
            height: 26.0,
            margin: const EdgeInsets.only(
              top: 24.0,
              bottom: 16,
            ),
            child: Row(
              children: [
                /// History
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      LanguageKey.history.tr +
                          (listKids.isNotEmpty ? ' (${listKids.length})' : ''),
                      textAlign: TextAlign.left,
                      style: TextStyles.mediumTextStyle(
                        size: 14.0,
                        color: AppColor.black1C2030,
                      ),
                    ),
                  ),
                ),

                /// View All
                Container(
                  height: 26.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13.0),
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        AppColor.pinkF27781,
                        AppColor.pinkF2A0C6,
                      ],
                    ),
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    onPressed: () {
                      viewAllAction();
                    },
                    child: Container(
                      height: 26,
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.only(right: 4.0),
                            child: Text(
                              LanguageKey.viewAll.tr,
                              textAlign: TextAlign.left,
                              style: TextStyles.mediumTextStyle(
                                size: 14.0,
                                color: AppColor.white,
                              ),
                            ),
                          ),
                          Container(
                            width: 16.0,
                            height: 16.0,
                            alignment: Alignment.center,
                            child: Image.asset(
                              AppImages.icViewAll,
                              width: 16.0,
                              height: 16.0,
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// List Body
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: listKids.length,
              itemBuilder: (conext, index) {
                final kid = listKids[index];
                return SizedBox(
                  height: 48.0,
                  child: Row(
                    children: [
                      /// Image
                      Container(
                        margin: const EdgeInsets.only(right: 16.0),
                        width: 40.0,
                        height: 40.0,
                        alignment: Alignment.center,
                        child: Image.asset(
                          AppImages.icKid,
                          width: 40.0,
                          height: 40.0,
                          fit: BoxFit.cover,
                        ),
                      ),

                      /// Expanded
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            LanguageKey.kid.tr,
                            textAlign: TextAlign.left,
                            style: TextStyles.mediumTextStyle(
                              size: 14.0,
                              color: AppColor.black1C2030,
                            ),
                          ),
                        ),
                      ),

                      /// Amount
                      Container(
                        alignment: Alignment.centerRight,
                        margin: const EdgeInsets.only(right: 2),
                        child: Text(
                          kid.date ?? '',
                          textAlign: TextAlign.left,
                          style: TextStyles.normalTextStyle(
                            size: 14.0,
                            color: AppColor.black1C2030,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
