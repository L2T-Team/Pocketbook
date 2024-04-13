import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketbook/model/responses/category_model.dart';
import 'package:pocketbook/my_app.dart';
import 'package:pocketbook/utils/app_constant.dart';
import 'package:pocketbook/utils/app_routes.dart';
import 'package:pocketbook/views/setting/detail_category/widget/delete_category_popup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pocketbook/repos/auth_repo.dart';

class DetailCategoryController extends GetxController {
  AuthRepo authRepo;
  SharedPreferences sharedPreferences;

  DetailCategoryController({
    required this.authRepo,
    required this.sharedPreferences,
  });

  final Rxn<CategoryModel> categoryDetail = Rxn<CategoryModel>();
  StreamSubscription? subscription;

  /// Init
  @override
  void onInit() {
    super.onInit();
    categoryDetail.value = Get.arguments;
    subscription = eventBus.on().listen((event) {
      if (event == EventConstant.categoryEvent) {
        getDetailCategory();
      }
    });
  }

  //////////////////////////////////////////////////////////
  /// Get Detail Category
  //////////////////////////////////////////////////////////
  void getDetailCategory() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      final itemFirebase = (await FirebaseFirestore.instance
          .collection(CollectionConstant.user)
          .doc(user?.uid ?? '')
          .collection(CollectionConstant.category)
          .doc(categoryDetail.value?.id ?? '')
          .get());
      categoryDetail.value = CategoryModel.fromJson(itemFirebase);
    } catch (_) {}
  }

  //////////////////////////////////////////////////////////
  /// Delete Detail Category
  //////////////////////////////////////////////////////////
  void deleteDetailCategory() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      (await FirebaseFirestore.instance
          .collection(CollectionConstant.user)
          .doc(user?.uid ?? '')
          .collection(CollectionConstant.category)
          .doc(categoryDetail.value?.id ?? '')
          .delete());
      eventBus.fire(EventConstant.categoryEvent);
      deleteImageFirestore();
      Get.back();
    } catch (_) {}
  }

  /// Delete Image FireStore
  void deleteImageFirestore() async {
    try {
      Reference photoRef = FirebaseStorage.instance.refFromURL(categoryDetail.value?.image ?? '');
      await photoRef.delete().then((value) {
      });
    } catch (_) {}
  }

  /// Delete Category
  void deleteCategory(BuildContext context, CategoryModel category) {
    showDialog(
      context: context,
      useSafeArea: false,
      builder: (context) {
        return DeleteCategoryPopup(
          deleteAction: () {
            deleteDetailCategory();
          },
        );
      },
    );
  }

  /// Edit Category
  void navigateEditCategory() {
    Get.toNamed(
      RoutesName.addEditCategory,
      arguments: categoryDetail.value,
    );
  }
}
