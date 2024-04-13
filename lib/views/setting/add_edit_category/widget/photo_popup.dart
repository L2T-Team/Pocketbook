import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pocketbook/language/language.dart';
import 'package:pocketbook/utils/app_asset.dart';
import 'package:pocketbook/utils/app_helper.dart';
import 'package:pocketbook/utils/app_style.dart';

class PhotoPopup extends StatelessWidget {
  final Function(XFile) takePhoto;
  final Function(XFile) choosePhoto;

  const PhotoPopup({
    super.key,
    required this.takePhoto,
    required this.choosePhoto,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Column(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const SizedBox.shrink(),
              ),
            ),

            /// Body
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 10,
                ),
                decoration: const BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.0),
                    topRight: Radius.circular(24.0),
                  ),
                ),
                child: SafeArea(
                  top: false,
                  bottom: true,
                  child: Row(
                    children: [
                      /// Take Photo
                      _buildPhoto(
                        context,
                        AppImages.icTakePhoto,
                        LanguageKey.takePhoto.tr,
                        () async {
                          // final hasPermission = 
                          //     await AppHelper.handleCameraPermission();
                          // if (!hasPermission) return;
                          final result =
                              await AppHelper.pickImage(ImageSource.camera);
                          if (result != null) {
                            takePhoto(result);
                            Get.back();
                          }
                        },
                      ),

                      /// Choose Photo
                      _buildPhoto(
                        context,
                        AppImages.icLibrary,
                        LanguageKey.chooseFromLibrary.tr,
                        () async {
                          // final hasPermission =
                          //     await AppHelper.handleGalleryPermission();
                          // if (!hasPermission) return;
                          final result =
                              await AppHelper.pickImage(ImageSource.gallery);
                          if (result != null) {
                            choosePhoto(result);
                            Get.back();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhoto(
    BuildContext context,
    String image,
    String title,
    Function onTap,
  ) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        child: InkWell(
          onTap: () {
            onTap();
          },
          child: Column(
            children: [
              /// Image
              Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                width: 56.0,
                height: 56.0,
                alignment: Alignment.center,
                child: Image.asset(
                  image,
                  width: 56.0,
                  height: 56.0,
                  fit: BoxFit.cover,
                ),
              ),

              /// Text
              Container(
                alignment: Alignment.center,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyles.normalTextStyle(
                    size: 14.0,
                    color: AppColor.black1C2030,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
