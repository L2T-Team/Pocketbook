import 'dart:developer';
import 'package:get/get.dart';
import 'package:pocketbook/core/services/stripe_service.dart';

class RepoServices {
  static Future<void> initServices() async {
    log('Starting repo services ...', name: 'RepoServices');
    Get.lazyPut<StripeService>(() => StripeServiceImpl(), fenix: true);

    // Get.lazyPut<FirebaseRepo>(
    //     () => FirebaseRepoImpl(
    //           firebaseApi: Get.find(),
    //         ),
    //     fenix: true);
    log('All repo services started! ✅', name: 'RepoServices');
  }
}
