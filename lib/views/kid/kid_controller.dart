import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pocketbook/repos/auth_repo.dart';

class KidController extends GetxController {
  AuthRepo authRepo;
  SharedPreferences sharedPreferences;

  KidController({
    required this.authRepo,
    required this.sharedPreferences,
  });

  /// Init
  @override
  void onInit() {
    super.onInit();
  }
}
