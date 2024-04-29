import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pocketbook/language/language.dart';
import 'package:pocketbook/model/responses/user_model.dart';
import 'package:pocketbook/my_app.dart';
import 'package:pocketbook/utils/app_constant.dart';
import 'package:pocketbook/utils/app_helper.dart';
import 'package:pocketbook/utils/app_routes.dart';
import 'package:pocketbook/views/setting/add_edit_category/widget/photo_popup.dart';
import 'package:pocketbook/views/setting/widget/edit_username_popup.dart';
import 'package:pocketbook/views/setting/widget/logout_popup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pocketbook/repos/auth_repo.dart';
import 'package:uuid/uuid.dart';

class SettingController extends GetxController {
  AuthRepo authRepo;
  SharedPreferences sharedPreferences;

  SettingController({
    required this.authRepo,
    required this.sharedPreferences,
  });

  final Rx<bool> isLoading = Rx<bool>(false);
  final Rx<String> avatarUrl = Rx<String>('');
  final Rx<String> username = Rx<String>('');
  final FocusNode focusNodeUsername = FocusNode();
  final TextEditingController controllerUsername = TextEditingController();
  final Rx<bool> isFocusUsername = Rx<bool>(false);
  final Rxn<AvatarModel> avatarModel = Rxn<AvatarModel>();
  final Rxn<UserNameModel> usernameModel = Rxn<UserNameModel>();

  /// Init
  @override
  void onInit() {
    super.onInit();
    focusNodeUsername.addListener(_onFocusChangeUsername);

    ///
    getAvatar();
    getUserName();
  }

  /// On Ready
  @override
  void onReady() {
    super.onReady();
    AppHelper.checkAuthorization();
  }

  @override
  void dispose() {
    super.dispose();
    focusNodeUsername.removeListener(_onFocusChangeUsername);
    focusNodeUsername.dispose();
  }

  void _onFocusChangeUsername() {
    isFocusUsername.value = focusNodeUsername.hasFocus;
  }

  //////////////////////////////////////////////////////////
  /// Get Avatar
  //////////////////////////////////////////////////////////
  void getAvatar() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      final itemFirebase = (await FirebaseFirestore.instance
          .collection(CollectionConstant.user)
          .doc(user?.uid ?? '')
          .collection(CollectionConstant.avatar)
          .doc(user?.uid ?? '')
          .get());
      final AvatarModel avatarF = AvatarModel.fromJson(itemFirebase);
      if ((avatarF.avatar ?? '').isNotEmpty) {
        avatarModel.value = avatarF;
        avatarUrl.value = avatarModel.value?.avatar ?? '';
      }
    } catch (_) {}
  }

  //////////////////////////////////////////////////////////
  /// Get Username
  //////////////////////////////////////////////////////////
  void getUserName() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      final itemFirebase = (await FirebaseFirestore.instance
          .collection(CollectionConstant.user)
          .doc(user?.uid ?? '')
          .collection(CollectionConstant.username)
          .doc(user?.uid ?? '')
          .get());
      final UserNameModel userF = UserNameModel.fromJson(itemFirebase);
      if ((userF.username ?? '').isNotEmpty) {
        usernameModel.value = userF;
        username.value = usernameModel.value?.username ?? '';
      }
    } catch (_) {}
  }

  /// Logout Action
  void logOutAction(BuildContext context) {
    showDialog(
      context: context,
      useSafeArea: false,
      builder: (context) {
        return const LogoutPopup();
      },
    );
  }

  /// Category
  void navigateCategory() {
    Get.toNamed(RoutesName.category);
  }

  /// Photo Action
  void photoAction(BuildContext context) {
    showDialog(
      context: context,
      useSafeArea: false,
      builder: (context) {
        return PhotoPopup(
          takePhoto: (XFile file) {
            cropCircleImage(context, file);
          },
          choosePhoto: (XFile file) {
            cropCircleImage(context, file);
          },
        );
      },
    );
  }

  /// Edit Username
  void editUserNameAction(BuildContext context) {
    controllerUsername.text = username.value;
    showDialog(
      context: context,
      useSafeArea: false,
      builder: (context) {
        return Obx(
          () => EditUsernamePopup(
            confirmAction: () async {
              try {
                final user = FirebaseAuth.instance.currentUser;
                final UserNameModel request = UserNameModel(
                  id: user?.uid ?? '',
                  username: controllerUsername.text,
                );
                if (usernameModel.value == null) {
                  /// Add New
                  await FirebaseFirestore.instance
                      .collection(CollectionConstant.user)
                      .doc(user?.uid ?? '')
                      .collection(CollectionConstant.username)
                      .doc(user?.uid ?? '')
                      .set(request.toJson());
                } else {
                  /// Edit
                  await FirebaseFirestore.instance
                      .collection(CollectionConstant.user)
                      .doc(user?.uid ?? '')
                      .collection(CollectionConstant.username)
                      .doc(user?.uid ?? '')
                      .update(request.toJson());
                }
                usernameModel.value = request;
                username.value = usernameModel.value?.username ?? '';
                isLoading(false);
              } catch (_) {
                isLoading(false);
                AppHelper.showError(LanguageKey.somethingWentWrong.tr);
              }
            },
            focusNodeUsername: focusNodeUsername,
            controllerUsername: controllerUsername,
            isFocusUsername: isFocusUsername.value,
          ),
        );
      },
    );
  }

  /// Crop Circle Image
  void cropCircleImage(BuildContext context, XFile file) async {
    /// Check Image Over 10 MB
    if (await AppHelper.checkSizeImageOver10Mb(file.path)) {
      AppHelper.showError(LanguageKey.errorOverImage10Mb.tr);
      return;
    }
    try {
      // CroppedFile? croppedFile = await ImageCropper().cropImage(
      //   sourcePath: file.path,
      //   aspectRatioPresets: [
      //     CropAspectRatioPreset.square,
      //   ],
      //   cropStyle: CropStyle.circle,
      //   uiSettings: [
      //     AndroidUiSettings(
      //       toolbarTitle: '',
      //     ),
      //     IOSUiSettings(
      //       title: '',
      //     ),
      //     WebUiSettings(
      //       context: context,
      //     ),
      //   ],
      // );
      isLoading(true);

      /// Upload
      final nameImage = '${const Uuid().v4()}.jpg';
      final metadata = SettableMetadata(contentType: "image/jpeg");
      final storageRef = FirebaseStorage.instance.ref().child(nameImage);
      final uploadTask = storageRef.putData(await file.readAsBytes(), metadata);

      uploadTask.whenComplete(() async {
        /// Delete Url
        if (avatarUrl.value.isNotEmpty) {
          try {
            Reference photoRef =
                FirebaseStorage.instance.refFromURL(avatarUrl.value);
            await photoRef.delete().then((value) {});
          } catch (_) {}
        }
        avatarUrl.value = await storageRef.getDownloadURL();
        final user = FirebaseAuth.instance.currentUser;
        final AvatarModel request = AvatarModel(
          id: user?.uid ?? '',
          avatar: avatarUrl.value,
        );
        if (avatarModel.value == null) {
          /// Add New
          await FirebaseFirestore.instance
              .collection(CollectionConstant.user)
              .doc(user?.uid ?? '')
              .collection(CollectionConstant.avatar)
              .doc(user?.uid ?? '')
              .set(request.toJson());
        } else {
          /// Edit
          await FirebaseFirestore.instance
              .collection(CollectionConstant.user)
              .doc(user?.uid ?? '')
              .collection(CollectionConstant.avatar)
              .doc(user?.uid ?? '')
              .update(request.toJson());
        }
        avatarModel.value = request;
        eventBus.fire(EventConstant.updateAvatarEvent);
        isLoading(false);
      });
    } catch (_) {
      isLoading(false);
      // AppHelper.showError(LanguageKey.somethingWentWrong.tr);
    }
  }
}
