import 'package:firebase_core/firebase_core.dart';

class FirebaseService {
  static Future<void> initFirebaseService() async {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: 'AIzaSyA3aALIDMsoAlJlAtrUGtf0Q4uQBdZ0LGc',
      appId: '1:149066493429:web:c62ef8586a7662042904bc',
      messagingSenderId: '149066493429',
      projectId: 'pocketbook-75861',
      storageBucket: 'pocketbook-75861.appspot.com',
    ));
  }
}
