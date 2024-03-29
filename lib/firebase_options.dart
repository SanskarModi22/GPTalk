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
    apiKey: 'AIzaSyB69lhddjz2xPYmD-ZF0st_u39YrXZzYkA',
    appId: '1:435217039059:web:7be27b45729eb6ec09de26',
    messagingSenderId: '435217039059',
    projectId: 'gp-talk',
    authDomain: 'gp-talk.firebaseapp.com',
    storageBucket: 'gp-talk.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCOyZYxxxuToL9JLx1f8BqpBouv_dM4T60',
    appId: '1:435217039059:android:8fe4e0cb196b121209de26',
    messagingSenderId: '435217039059',
    projectId: 'gp-talk',
    storageBucket: 'gp-talk.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDo6X_uiQLlqK1KFhSFMY211siBxCHjmXk',
    appId: '1:435217039059:ios:3753debf36a1a34d09de26',
    messagingSenderId: '435217039059',
    projectId: 'gp-talk',
    storageBucket: 'gp-talk.appspot.com',
    iosClientId: '435217039059-ln6n23tii25tddeql7fj6i4vg836uvm4.apps.googleusercontent.com',
    iosBundleId: 'com.example.gpTalk',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDo6X_uiQLlqK1KFhSFMY211siBxCHjmXk',
    appId: '1:435217039059:ios:3753debf36a1a34d09de26',
    messagingSenderId: '435217039059',
    projectId: 'gp-talk',
    storageBucket: 'gp-talk.appspot.com',
    iosClientId: '435217039059-ln6n23tii25tddeql7fj6i4vg836uvm4.apps.googleusercontent.com',
    iosBundleId: 'com.example.gpTalk',
  );
}
