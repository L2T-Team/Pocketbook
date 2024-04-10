import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:pocketbook/utils/app_enum.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions currentPlatform({required AppFlavor env}) {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for macOS - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        if (env == AppFlavor.prod) {
          return androidProd;
        }
        return androidStag;
      case TargetPlatform.iOS:
        if (env == AppFlavor.prod) {
          return iosProd;
        }
        return iosStag;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macOS - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions androidProd = FirebaseOptions(
    apiKey: 'AIzaSyC8_gPpk2PNVhCf9CLZpMj-00jraXdw0Qg',
    appId: '1:557201552504:android:91556398d2a473255b698d',
    messagingSenderId: '557201552504',
    projectId: 'mymedica-8ae3c',
  );

  static const FirebaseOptions iosProd = FirebaseOptions(
    apiKey: 'AIzaSyDSnY578OnBtR8-RNOxhjauhIwXo2XH6z8',
    appId: '1:557201552504:ios:91a71a072a6ae23a5b698d',
    messagingSenderId: '557201552504',
    projectId: 'mymedica-8ae3c',
    iosBundleId: 'com.app.test.medica',
  );

  static const FirebaseOptions androidStag = FirebaseOptions(
    apiKey: 'AIzaSyASa-q-akfByN9Lc2ZzoPV4EHdWS2qFgDs',
    appId: '1:322383886672:android:6b3c77804fd236485b1455',
    messagingSenderId: '322383886672',
    projectId: 'my-medica-staging',
  );

  static const FirebaseOptions iosStag = FirebaseOptions(
    apiKey: 'AIzaSyAFGQZZIzJ4d2-qA74iUNHeUQyvRtuxWI0',
    appId: '1:322383886672:ios:52a3ca85d5eb67d45b1455',
    messagingSenderId: '322383886672',
    projectId: 'my-medica-staging',
    iosBundleId: 'com.app.test.medica.develop',
  );
}
