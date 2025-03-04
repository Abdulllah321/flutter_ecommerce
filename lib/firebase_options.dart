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
    apiKey: 'AIzaSyDdoH1NZ0Z9zpn4IknrkMKWb7o4lzxXabg',
    appId: '1:185200946225:web:03bcbe481da0ed1f29f910',
    messagingSenderId: '185200946225',
    projectId: 'flutter-ecommerce-d582c',
    authDomain: 'flutter-ecommerce-d582c.firebaseapp.com',
    storageBucket: 'flutter-ecommerce-d582c.firebasestorage.app',
    measurementId: 'G-T8WQGH0PJP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAc7gx-d7yxWhXkbUd9QP---5VuoEPcl9c',
    appId: '1:185200946225:android:b1c52e3078fe13e129f910',
    messagingSenderId: '185200946225',
    projectId: 'flutter-ecommerce-d582c',
    storageBucket: 'flutter-ecommerce-d582c.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCjoOCUFO95VwZjGdJbgJylR0mTDwSY6eo',
    appId: '1:185200946225:ios:65b5ff2f326adde829f910',
    messagingSenderId: '185200946225',
    projectId: 'flutter-ecommerce-d582c',
    storageBucket: 'flutter-ecommerce-d582c.firebasestorage.app',
    androidClientId: '185200946225-sq7r8lmau8666i5gp5jglkdbi5v0q638.apps.googleusercontent.com',
    iosClientId: '185200946225-27nfatedru63g7h4ktb7060edbc0r1s5.apps.googleusercontent.com',
    iosBundleId: 'com.example.tStore',
  );

}