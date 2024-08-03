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
    apiKey: 'AIzaSyCfwKUVvBMflk6Pr_p9o5bB6OAS-l8qnrY',
    appId: '1:126627200880:web:41c56312783017f2a499b5',
    messagingSenderId: '126627200880',
    projectId: 'plantapp-a1ec6',
    authDomain: 'plantapp-a1ec6.firebaseapp.com',
    storageBucket: 'plantapp-a1ec6.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDJTUwrgYZ1hsApDDByQwL70wYjLQhDK0Q',
    appId: '1:126627200880:android:bade73b4cf035c4ca499b5',
    messagingSenderId: '126627200880',
    projectId: 'plantapp-a1ec6',
    storageBucket: 'plantapp-a1ec6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBZbwTRFsDtT-yClWn_9RW1ubN1v4fiZv4',
    appId: '1:126627200880:ios:e22a05eeb2298bcba499b5',
    messagingSenderId: '126627200880',
    projectId: 'plantapp-a1ec6',
    storageBucket: 'plantapp-a1ec6.appspot.com',
    iosBundleId: 'com.example.plantApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBZbwTRFsDtT-yClWn_9RW1ubN1v4fiZv4',
    appId: '1:126627200880:ios:e22a05eeb2298bcba499b5',
    messagingSenderId: '126627200880',
    projectId: 'plantapp-a1ec6',
    storageBucket: 'plantapp-a1ec6.appspot.com',
    iosBundleId: 'com.example.plantApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCfwKUVvBMflk6Pr_p9o5bB6OAS-l8qnrY',
    appId: '1:126627200880:web:d79f8371d68d07d6a499b5',
    messagingSenderId: '126627200880',
    projectId: 'plantapp-a1ec6',
    authDomain: 'plantapp-a1ec6.firebaseapp.com',
    storageBucket: 'plantapp-a1ec6.appspot.com',
  );
}
