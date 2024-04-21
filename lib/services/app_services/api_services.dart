import 'dart:developer';

class ApiServices {
  static Future<void> initServices() async {
    log('Starting api services ...', name: 'ApiServices');
    // Dio dio = Get.find<DioApi>().dio;
    // Dio dioUploadFile = dioApiUploadFile();
    // Get.put<UserloginApi>(UserloginApi(dio));
    log('All api services started! ✅', name: 'ApiServices');
  }
}
