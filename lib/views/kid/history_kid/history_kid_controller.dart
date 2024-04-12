import 'package:get/get.dart';
import 'package:pocketbook/model/responses/kid_confirm_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pocketbook/repos/auth_repo.dart';

class HistoryKidController extends GetxController {
  AuthRepo authRepo;
  SharedPreferences sharedPreferences;

  HistoryKidController({
    required this.authRepo,
    required this.sharedPreferences,
  });

  final Rx<List<KidConfirmModel>> listKids = Rx<List<KidConfirmModel>>([]);

  /// Init
  @override
  void onInit() {
    super.onInit();
    listKids.value = Get.arguments;
  }
}
