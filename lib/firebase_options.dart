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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyD_-z2psyoZQPiKChTYS-qPPjRTj_6Qmmg',
    appId: '1:1019636302559:web:6b3f0662c3fc6c1902df6a',
    messagingSenderId: '1019636302559',
    projectId: 'contactlist-86c7c',
    authDomain: 'contactlist-86c7c.firebaseapp.com',
    databaseURL: 'https://contactlist-86c7c-default-rtdb.firebaseio.com',
    storageBucket: 'contactlist-86c7c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBwJaY5Lak7oFdBH8y4T33aU3GwCYmOhd8',
    appId: '1:1019636302559:android:e9c0717024d9642d02df6a',
    messagingSenderId: '1019636302559',
    projectId: 'contactlist-86c7c',
    databaseURL: 'https://contactlist-86c7c-default-rtdb.firebaseio.com',
    storageBucket: 'contactlist-86c7c.appspot.com',
  );

}