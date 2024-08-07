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
    apiKey: 'AIzaSyA10feCEOloxqqSwN2O8ZT2XiIw8QoycJ8',
    appId: '1:636775170550:web:85243f03cadd04344907d7',
    messagingSenderId: '636775170550',
    projectId: 'cyberman-9722e',
    authDomain: 'cyberman-9722e.firebaseapp.com',
    databaseURL: 'https://cyberman-9722e-default-rtdb.firebaseio.com',
    storageBucket: 'cyberman-9722e.appspot.com',
    measurementId: 'G-QL94PFTV0L',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCIhx6yOQw9iukERAdSMQAn319lKITEk-s',
    appId: '1:636775170550:android:d70c2daeac48178a4907d7',
    messagingSenderId: '636775170550',
    projectId: 'cyberman-9722e',
    databaseURL: 'https://cyberman-9722e-default-rtdb.firebaseio.com',
    storageBucket: 'cyberman-9722e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBvktQuCL5YxqwU1UkdGrabNcnG_VQxELk',
    appId: '1:636775170550:ios:311e5254ea9cd94a4907d7',
    messagingSenderId: '636775170550',
    projectId: 'cyberman-9722e',
    databaseURL: 'https://cyberman-9722e-default-rtdb.firebaseio.com',
    storageBucket: 'cyberman-9722e.appspot.com',
    iosClientId: '636775170550-lft0a2ljbb9nn3bpfflk1heid8s69e5f.apps.googleusercontent.com',
    iosBundleId: 'com.example.verygoodcore.cyberman',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBvktQuCL5YxqwU1UkdGrabNcnG_VQxELk',
    appId: '1:636775170550:ios:e32db03ed12274174907d7',
    messagingSenderId: '636775170550',
    projectId: 'cyberman-9722e',
    databaseURL: 'https://cyberman-9722e-default-rtdb.firebaseio.com',
    storageBucket: 'cyberman-9722e.appspot.com',
    iosClientId: '636775170550-5nsk32qr626b9ct0fa4qdc1fqguf4jpn.apps.googleusercontent.com',
    iosBundleId: 'com.example.myApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA10feCEOloxqqSwN2O8ZT2XiIw8QoycJ8',
    appId: '1:636775170550:web:5ebbc3e5279a23474907d7',
    messagingSenderId: '636775170550',
    projectId: 'cyberman-9722e',
    authDomain: 'cyberman-9722e.firebaseapp.com',
    databaseURL: 'https://cyberman-9722e-default-rtdb.firebaseio.com',
    storageBucket: 'cyberman-9722e.appspot.com',
    measurementId: 'G-0YQJP3SN5L',
  );
}
