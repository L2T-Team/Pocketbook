import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pocketbook/language/language.dart';
import 'package:pocketbook/utils/app_asset.dart';
import 'package:pocketbook/utils/app_style.dart';
import 'package:get/get.dart';

class AvatarHeaderWidget extends StatelessWidget {
  final String username;
  final String avatarUrl;
  final Function onTapAvatar;
  final Function onTapUserName;
  const AvatarHeaderWidget({
    super.key,
    required this.username,
    required this.avatarUrl,
    required this.onTapAvatar,
    required this.onTapUserName,
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
                child: TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: Size.zero,
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: () {
                    onTapUserName();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Text(
                      username.isEmpty ? LanguageKey.name.tr : username,
                      textAlign: TextAlign.center,
                      style: TextStyles.mediumTextStyle(
                        size: 18.0,
                        color: AppColor.white,
                      ),
                      maxLines: 1,
                    ),
                  ),
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
            child: TextButton(
              style: TextButton.styleFrom(
                minimumSize: Size.zero,
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () {
                onTapAvatar();
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(44.0),
                child: (avatarUrl).isNotEmpty
                    ? CachedNetworkImage(
                        imageUrl: (avatarUrl),
                        width: 88.0,
                        height: 88.0,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => SpinKitCircle(
                          color: Colors.black.withOpacity(0.5),
                        ),
                      )
                    : Image.asset(
                        AppImages.icAvatar,
                        width: 88.0,
                        height: 88.0,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
