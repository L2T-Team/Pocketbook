import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pocketbook/language/language.dart';
import 'package:pocketbook/model/responses/category_model.dart';
import 'package:pocketbook/views/setting/add_edit_category/widget/photo_popup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pocketbook/repos/auth_repo.dart';

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
      itemSelected.value = categoryDetail.value?.type ?? '';
      controllerName.text = categoryDetail.value?.name ?? '';
      validateButtonAction();
    }
    focusNodeName.addListener(_onFocusChangeName);
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
      enableButton.value = controllerName.text.trim().isNotEmpty;
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
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: file.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
      ],
      cropStyle: CropStyle.circle,
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: '',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: '',
        ),
        WebUiSettings(
          context: context,
        ),
      ],
    );
    imageUrl.value = croppedFile?.path ?? '';
  }
}
