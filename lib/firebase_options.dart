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
    apiKey: 'AIzaSyBEqfq5yr8LVipgS9of4saBO593dEfTDgw',
    appId: '1:475159751478:web:172af7666e0b161624e197',
    messagingSenderId: '475159751478',
    projectId: 'learn-731c0',
    authDomain: 'learn-731c0.firebaseapp.com',
    databaseURL: 'https://learn-731c0-default-rtdb.firebaseio.com',
    storageBucket: 'learn-731c0.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBJIbIeZwTHu_a4yeS5-_JQJe_rscUC-YA',
    appId: '1:475159751478:android:e6529b343e79a91a24e197',
    messagingSenderId: '475159751478',
    projectId: 'learn-731c0',
    databaseURL: 'https://learn-731c0-default-rtdb.firebaseio.com',
    storageBucket: 'learn-731c0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyByUBR_S71He9E5_nXDEvQr5_QYSqIBL04',
    appId: '1:475159751478:ios:3e09b73954942f5624e197',
    messagingSenderId: '475159751478',
    projectId: 'learn-731c0',
    databaseURL: 'https://learn-731c0-default-rtdb.firebaseio.com',
    storageBucket: 'learn-731c0.appspot.com',
    iosClientId: '475159751478-8s6banf1bgvq4ea6jlc0i9925hi8l9g8.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterWeb1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyByUBR_S71He9E5_nXDEvQr5_QYSqIBL04',
    appId: '1:475159751478:ios:3e09b73954942f5624e197',
    messagingSenderId: '475159751478',
    projectId: 'learn-731c0',
    databaseURL: 'https://learn-731c0-default-rtdb.firebaseio.com',
    storageBucket: 'learn-731c0.appspot.com',
    iosClientId: '475159751478-8s6banf1bgvq4ea6jlc0i9925hi8l9g8.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterWeb1',
  );
}
