// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyAmb4YRm5PMsbD0tosh7-Y1n4LXJA3BbnE',
    appId: '1:89461860351:web:945ac1149b9a58e71d69ca',
    messagingSenderId: '89461860351',
    projectId: 'crypto-list-app-my',
    authDomain: 'crypto-list-app-my.firebaseapp.com',
    storageBucket: 'crypto-list-app-my.appspot.com',
    measurementId: 'G-CTFKF5WP04',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAtRy4tdvcmgQMCxt8mQ6MAwGvxwXAW91g',
    appId: '1:89461860351:ios:e6b2b18fd08a42df1d69ca',
    messagingSenderId: '89461860351',
    projectId: 'crypto-list-app-my',
    storageBucket: 'crypto-list-app-my.appspot.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAtRy4tdvcmgQMCxt8mQ6MAwGvxwXAW91g',
    appId: '1:89461860351:ios:e6b2b18fd08a42df1d69ca',
    messagingSenderId: '89461860351',
    projectId: 'crypto-list-app-my',
    storageBucket: 'crypto-list-app-my.appspot.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAmb4YRm5PMsbD0tosh7-Y1n4LXJA3BbnE',
    appId: '1:89461860351:web:c46bf3934ec4d73a1d69ca',
    messagingSenderId: '89461860351',
    projectId: 'crypto-list-app-my',
    authDomain: 'crypto-list-app-my.firebaseapp.com',
    storageBucket: 'crypto-list-app-my.appspot.com',
    measurementId: 'G-5BT4GC4D67',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBKBrjuc1VPa5MGQ3fRTwe65xwXaH3kVAE',
    appId: '1:89461860351:android:4617829e6fa6d77c1d69ca',
    messagingSenderId: '89461860351',
    projectId: 'crypto-list-app-my',
    storageBucket: 'crypto-list-app-my.appspot.com',
  );

}