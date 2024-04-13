import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pocketbook/language/language.dart';
import 'package:pocketbook/model/responses/category_model.dart';
import 'package:pocketbook/my_app.dart';
import 'package:pocketbook/utils/app_constant.dart';
import 'package:pocketbook/utils/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pocketbook/repos/auth_repo.dart';

class CategoryController extends GetxController {
  AuthRepo authRepo;
  SharedPreferences sharedPreferences;

  CategoryController({
    required this.authRepo,
    required this.sharedPreferences,
  });
  StreamSubscription? subscription;

  final Rx<String> indicatorSelected = Rx<String>(LanguageKey.expense.tr);
  final Rx<List<CategoryModel>> listCategories = Rx<List<CategoryModel>>([]);

  /// Init
  @override
  void onInit() {
    super.onInit();
    getCategories();
    subscription = eventBus.on().listen((event) {
      if (event == EventConstant.categoryEvent) {
        getCategories();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    subscription?.cancel();
  }

  //////////////////////////////////////////////////////////
  /// Get Categories
  //////////////////////////////////////////////////////////
  void getCategories() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      final List<CategoryModel> listCats = [];
      final listFirebase = (await FirebaseFirestore.instance
              .collection(CollectionConstant.user)
              .doc(user?.uid ?? '')
              .collection(CollectionConstant.category)
              .get())
          .docs;

      for (var it in listFirebase) {
        listCats.add(CategoryModel.fromJson(it));
      }
      listCategories.value = listCats;
    } catch (_) {}
  }

  /// Detail Category
  void navigateToDetailCategory(CategoryModel category) {
    Get.toNamed(RoutesName.categoryDetail, arguments: category);
  }

  /// Add Category
  void navigateAddCategory() {
    Get.toNamed(RoutesName.addEditCategory);
  }
}
