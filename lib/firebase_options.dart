// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAMaxS6bKJEGSlJK0PccZ1_e9Nq3Oy0c6k',
    appId: '1:278575488994:web:0007c0f30afd5067c4a3bb',
    messagingSenderId: '278575488994',
    projectId: 'bestshop-67822',
    authDomain: 'bestshop-67822.firebaseapp.com',
    storageBucket: 'bestshop-67822.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBvhqiGTw0R18AMQOkXFVDxOgWCgvu9jvg',
    appId: '1:278575488994:android:43f17be7d542811dc4a3bb',
    messagingSenderId: '278575488994',
    projectId: 'bestshop-67822',
    storageBucket: 'bestshop-67822.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB_i5HCrqpCWM0ZyBVnPJGpxAJEnwImMiw',
    appId: '1:278575488994:ios:af6914095d8652a8c4a3bb',
    messagingSenderId: '278575488994',
    projectId: 'bestshop-67822',
    storageBucket: 'bestshop-67822.appspot.com',
    iosBundleId: 'com.example.ecommerceAppEn',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB_i5HCrqpCWM0ZyBVnPJGpxAJEnwImMiw',
    appId: '1:278575488994:ios:95e5dbe61e452636c4a3bb',
    messagingSenderId: '278575488994',
    projectId: 'bestshop-67822',
    storageBucket: 'bestshop-67822.appspot.com',
    iosBundleId: 'com.example.ecommerceAppEn.RunnerTests',
  );
}
