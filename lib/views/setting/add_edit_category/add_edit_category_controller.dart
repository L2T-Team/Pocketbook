import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pocketbook/language/language.dart';
import 'package:pocketbook/model/responses/category_model.dart';
import 'package:pocketbook/my_app.dart';
import 'package:pocketbook/utils/app_constant.dart';
import 'package:pocketbook/utils/app_helper.dart';
import 'package:pocketbook/views/setting/add_edit_category/widget/photo_popup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pocketbook/repos/auth_repo.dart';
import 'package:uuid/uuid.dart';

class AddEditCategoryController extends GetxController {
  AuthRepo authRepo;
  SharedPreferences sharedPreferences;

  AddEditCategoryController({
    required this.authRepo,
    required this.sharedPreferences,
  });

  final Rxn<CategoryModel> categoryDetail = Rxn<CategoryModel>();
  final FocusNode focusNodeName = FocusNode();
  final TextEditingController controllerName = TextEditingController();
  final Rx<bool> enableButton = Rx<bool>(false);
  final Rx<bool> isFocusName = Rx<bool>(false);
  final Rx<bool> isLoading = Rx<bool>(false);
  final Rx<String> itemSelected = Rx<String>(LanguageKey.expense.tr);
  final Rx<String> imageUrl = Rx<String>('');

  /// Init
  @override
  void onInit() {
    super.onInit();
    categoryDetail.value = Get.arguments;
    if (categoryDetail.value != null) {
      imageUrl.value = categoryDetail.value?.image ?? '';
      itemSelected.value = categoryDetail.value?.type ?? '';
      controllerName.text = categoryDetail.value?.name ?? '';
      validateButtonAction();
    }
    focusNodeName.addListener(_onFocusChangeName);
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
    focusNodeName.removeListener(_onFocusChangeName);
    focusNodeName.dispose();
  }

  void _onFocusChangeName() {
    isFocusName.value = focusNodeName.hasFocus;
  }

  /// Validate Buttton
  void validateButtonAction() {
    Future.delayed(const Duration(milliseconds: 10)).then((value) {
      enableButton.value =
          controllerName.text.trim().isNotEmpty;
    });
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

  /// Crop Circle Image
  void cropCircleImage(BuildContext context, XFile file) async {
    isLoading(true);

    /// Check Image Over 10 MB
    if (await AppHelper.checkSizeImageOver10Mb(file.path)) {
      isLoading(false);
      AppHelper.showError(LanguageKey.errorOverImage10Mb.tr);
      return;
    }
    try {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: file.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
        ],
        cropStyle: CropStyle.circle,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: '',
          ),
          IOSUiSettings(
            title: '',
          ),
          WebUiSettings(
            context: context,
          ),
        ],
      );

      /// Upload
      // final path = file.path;
      final nameImage = '${const Uuid().v4()}.jpg';
      final metadata = SettableMetadata(contentType: "image/jpeg");
      final storageRef = FirebaseStorage.instance.ref().child(nameImage);
      final uploadTask = storageRef.putData(await croppedFile!.readAsBytes(), metadata);

      uploadTask.whenComplete(() async {
        /// Delete Url
        if (imageUrl.value.isNotEmpty) {
          try {
            Reference photoRef =
                FirebaseStorage.instance.refFromURL(imageUrl.value);
            await photoRef.delete().then((value) {});
          } catch (_) {}
        }
        imageUrl.value = await storageRef.getDownloadURL();
        isLoading(false);
        validateButtonAction();
      });
    } catch (e) {
      isLoading(false);
      AppHelper.showError(LanguageKey.somethingWentWrong.tr);
    }
  }

  ///////////////////////////////////////////////
  /// Add Edit Action
  ///////////////////////////////////////////////
  void addEditAction(BuildContext context) async {
    FocusScope.of(context).unfocus();
    isLoading(true);
    try {
      final uuid = categoryDetail.value == null
          ? (const Uuid().v4())
          : (categoryDetail.value?.id ?? '');
      final user = FirebaseAuth.instance.currentUser;
      final CategoryModel request = CategoryModel(
        id: uuid,
        name: controllerName.text,
        type: itemSelected.value,
        image: imageUrl.value,
      );
      if (categoryDetail.value == null) {
        /// Add New
        await FirebaseFirestore.instance
            .collection(CollectionConstant.user)
            .doc(user?.uid ?? '')
            .collection(CollectionConstant.category)
            .doc(uuid)
            .set(request.toJson());
      } else {
        /// Edit
        await FirebaseFirestore.instance
            .collection(CollectionConstant.user)
            .doc(user?.uid ?? '')
            .collection(CollectionConstant.category)
            .doc(uuid)
            .update(request.toJson());
      }
      eventBus.fire(EventConstant.categoryEvent);
      Get.back();
      isLoading(false);
    } catch (_) {
      isLoading(false);
      // AppHelper.showError(LanguageKey.somethingWentWrong.tr);
    }
  }
}
