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
    apiKey: 'AIzaSyCcAy0LYzGSJPxTjt-eopXJ1k4o818fX-4',
    appId: '1:1049456793144:web:a362897186bfcf32fd78cd',
    messagingSenderId: '1049456793144',
    projectId: 'connect4-39483',
    authDomain: 'connect4-39483.firebaseapp.com',
    storageBucket: 'connect4-39483.appspot.com',
    measurementId: 'G-M9Q7JRPLY9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDo6XXn20_-EL2Np7ZyOZ995uG10G3Zb_g',
    appId: '1:1049456793144:android:c1eb2ea9e1d08b53fd78cd',
    messagingSenderId: '1049456793144',
    projectId: 'connect4-39483',
    storageBucket: 'connect4-39483.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBqP24OBJr9sDlAlUn3C5IpL131olciI8w',
    appId: '1:1049456793144:ios:574bb68622d375c4fd78cd',
    messagingSenderId: '1049456793144',
    projectId: 'connect4-39483',
    storageBucket: 'connect4-39483.appspot.com',
    iosBundleId: 'com.example.connectFour',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBqP24OBJr9sDlAlUn3C5IpL131olciI8w',
    appId: '1:1049456793144:ios:574bb68622d375c4fd78cd',
    messagingSenderId: '1049456793144',
    projectId: 'connect4-39483',
    storageBucket: 'connect4-39483.appspot.com',
    iosBundleId: 'com.example.connectFour',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCcAy0LYzGSJPxTjt-eopXJ1k4o818fX-4',
    appId: '1:1049456793144:web:38cc514a52e9f0fcfd78cd',
    messagingSenderId: '1049456793144',
    projectId: 'connect4-39483',
    authDomain: 'connect4-39483.firebaseapp.com',
    storageBucket: 'connect4-39483.appspot.com',
    measurementId: 'G-6GW3N3TS41',
  );

}