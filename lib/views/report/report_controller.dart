import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pocketbook/repos/auth_repo.dart';

class ReportController extends GetxController {
  AuthRepo authRepo;
  SharedPreferences sharedPreferences;

  ReportController({
    required this.authRepo,
    required this.sharedPreferences,
  });

  /// Init
  @override
  void onInit() {
    super.onInit();
  }
}
