import 'package:firebase_core/firebase_core.dart';

class FirebaseService {
  static Future<void> initFirebaseService() async {
    await Firebase.initializeApp();
  }
}
