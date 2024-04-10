import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:pocketbook/utils/app_asset.dart';
import 'package:pocketbook/utils/app_style.dart';

class AvatarHeaderWidget extends StatelessWidget {
  final String username;
  const AvatarHeaderWidget({
    super.key,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                AppColor.pinkF27781,
                AppColor.pinkF2A0C6,
              ],
            ),
          ),
          height: MediaQuery.of(context).padding.top + 92.0,
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top),
              Container(
                height: 42,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.center,
                child: Text(
                  username,
                  textAlign: TextAlign.center,
                  style: TextStyles.mediumTextStyle(
                    size: 18.0,
                    color: AppColor.white,
                  ),
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),

        /// Avatar
        Container(
          alignment: Alignment.center,
          child: Container(
            alignment: Alignment.center,
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).padding.top + 48.0),
            width: 88.0,
            height: 88.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(44.0),
              color: AppColor.grey1E2A3B,
            ),
            child: Image.asset(
              AppImages.icAvatar,
              width: 88.0,
              height: 88.0,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
