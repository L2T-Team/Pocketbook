import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketbook/language/language.dart';
import 'package:pocketbook/utils/app_helper.dart';
import 'package:pocketbook/utils/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pocketbook/repos/auth_repo.dart';

class LoginController extends GetxController {
  AuthRepo authRepo;
  SharedPreferences sharedPreferences;

  final FocusNode focusNodeUsername = FocusNode();
  final TextEditingController controllerUsername = TextEditingController();
  final FocusNode focusNodePassword = FocusNode();
  final TextEditingController controllerPassword = TextEditingController();
  final Rx<bool> isObsecure = Rx<bool>(true);
  final Rx<bool> enableButton = Rx<bool>(false);
  final Rx<bool> isFocusUsername = Rx<bool>(false);
  final Rx<bool> isFocusPassword = Rx<bool>(false);
  final Rx<bool> isLoading = Rx<bool>(false);

  LoginController({
    required this.authRepo,
    required this.sharedPreferences,
  });

  /// Init
  @override
  void onInit() {
    super.onInit();
    focusNodeUsername.addListener(_onFocusChangeUsername);
    focusNodePassword.addListener(_onFocusChangePassword);
  }

  @override
  void dispose() {
    super.dispose();
    focusNodeUsername.removeListener(_onFocusChangeUsername);
    focusNodeUsername.dispose();
    focusNodePassword.removeListener(_onFocusChangePassword);
    focusNodePassword.dispose();
  }

  void _onFocusChangeUsername() {
    isFocusUsername.value = focusNodeUsername.hasFocus;
  }

  void _onFocusChangePassword() {
    isFocusPassword.value = focusNodePassword.hasFocus;
  }

  /// Validate Buttton
  void validateButtonAction() {
    Future.delayed(const Duration(milliseconds: 10)).then((value) {
      enableButton.value = controllerUsername.text.trim().isNotEmpty &&
          controllerPassword.text.trim().isNotEmpty;
    });
  }

  /// Login Action
  void login(String email, String password, BuildContext context) async {
    try {
      isLoading(true);
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      isLoading(false);
      Get.offAllNamed(RoutesName.main);
    } on FirebaseAuthException catch (e) {
      isLoading(false);
      if (e.code == 'user-not-found') {
        AppHelper.showError(LanguageKey.noUserFound.tr);
      }
      if (e.code == 'wrong-password' || e.code == 'invalid-credential') {
        AppHelper.showError(LanguageKey.wrongPassword.tr);
      }
    } catch (e) {
      isLoading(false);
      AppHelper.showError(LanguageKey.somethingWentWrong.tr);
    }
  }
}
