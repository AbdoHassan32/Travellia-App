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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDmKh6PZxi07Zdv_00pJbTl9KH-5gfndaw',
    appId: '1:263628969458:web:b614e54041a492f878c76b',
    messagingSenderId: '263628969458',
    projectId: 'travellia-app',
    authDomain: 'travellia-app.firebaseapp.com',
    storageBucket: 'travellia-app.appspot.com',
    measurementId: 'G-QPHNSCQL5R',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDPFZM0CSHwYl9pG1F3g1RYNB6CwaWlM2g',
    appId: '1:263628969458:android:af27468fa550f0b578c76b',
    messagingSenderId: '263628969458',
    projectId: 'travellia-app',
    storageBucket: 'travellia-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCRS7tdXli2DhyQVNbOKe1TY4x__NWzDMw',
    appId: '1:263628969458:ios:c5720c190e200bc578c76b',
    messagingSenderId: '263628969458',
    projectId: 'travellia-app',
    storageBucket: 'travellia-app.appspot.com',
    iosClientId: '263628969458-bbshc88ialo5kcj9fk1uacib27mnp1cg.apps.googleusercontent.com',
    iosBundleId: 'com.example.travellia',
  );
}