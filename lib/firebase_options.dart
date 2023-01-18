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
    apiKey: 'AIzaSyC2KIUi6ZaRCuHSl7c_6xSsoHNQCo0E_5A',
    appId: '1:521193247291:web:36d9ccc26a63dc3805021e',
    messagingSenderId: '521193247291',
    projectId: 'pallinet-9db77',
    authDomain: 'pallinet-9db77.firebaseapp.com',
    storageBucket: 'pallinet-9db77.appspot.com',
    measurementId: 'G-ED6PFK78SW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDPQpHjyrB0Rf0XQxXtV1MNiDqoMPOCeWE',
    appId: '1:521193247291:android:e989f383238eb77e05021e',
    messagingSenderId: '521193247291',
    projectId: 'pallinet-9db77',
    storageBucket: 'pallinet-9db77.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB2vEXmDTVGjgpJUA7YsDh-WSy7SJA658c',
    appId: '1:521193247291:ios:8d7de991eb8a099805021e',
    messagingSenderId: '521193247291',
    projectId: 'pallinet-9db77',
    storageBucket: 'pallinet-9db77.appspot.com',
    iosClientId: '521193247291-f0ms9pmfnqh4bhu368tg9pibtt6jt6j7.apps.googleusercontent.com',
    iosBundleId: 'com.example.pallinet',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB2vEXmDTVGjgpJUA7YsDh-WSy7SJA658c',
    appId: '1:521193247291:ios:8d7de991eb8a099805021e',
    messagingSenderId: '521193247291',
    projectId: 'pallinet-9db77',
    storageBucket: 'pallinet-9db77.appspot.com',
    iosClientId: '521193247291-f0ms9pmfnqh4bhu368tg9pibtt6jt6j7.apps.googleusercontent.com',
    iosBundleId: 'com.example.pallinet',
  );
}