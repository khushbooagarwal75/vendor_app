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
    apiKey: 'AIzaSyA85kMlG4LfL7674KBzwfa22q25MY0Qd48',
    appId: '1:531472058650:web:434031b710eb2ce56844a3',
    messagingSenderId: '531472058650',
    projectId: 'assignment-app-fe33f',
    authDomain: 'assignment-app-fe33f.firebaseapp.com',
    storageBucket: 'assignment-app-fe33f.appspot.com',
    measurementId: 'G-06VX32228X',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA5q6LjOVGXg6K94wD7_nHEFbpd_o2AHAk',
    appId: '1:531472058650:android:bc54c54387850d5c6844a3',
    messagingSenderId: '531472058650',
    projectId: 'assignment-app-fe33f',
    storageBucket: 'assignment-app-fe33f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBVn3XcPYNr7ld3ptJ3z0VmwsuBW1PS5Bg',
    appId: '1:531472058650:ios:482c778e92f8aa416844a3',
    messagingSenderId: '531472058650',
    projectId: 'assignment-app-fe33f',
    storageBucket: 'assignment-app-fe33f.appspot.com',
    iosBundleId: 'com.example.vendorApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBVn3XcPYNr7ld3ptJ3z0VmwsuBW1PS5Bg',
    appId: '1:531472058650:ios:6a0acd12147154556844a3',
    messagingSenderId: '531472058650',
    projectId: 'assignment-app-fe33f',
    storageBucket: 'assignment-app-fe33f.appspot.com',
    iosBundleId: 'com.example.vendorApp.RunnerTests',
  );
}
