import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/app.dart';
import 'package:music_app/data/repositories/authentication/auth_repository.dart';

import 'firebase_options.dart';

Future<void> main() async {
  // Todo : Add Widgets Binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  // Todo Initalize Firebase
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
  //     .then((FirebaseApp value) => Get.put(AuthRepository()));
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ).then((FirebaseApp app) {
      // Initialization successful
      Get.put(AuthRepository());
    }).catchError((error) {
      // Handle errors during initialization
      print('Error during Firebase initialization: $error');
    });
  } catch (e) {
    // Handle any other errors
    print('Error: $e');
  }

  // Todo : Initlize Firebase
  //await Firebase.init
  // runApp(DevicePreview(
  //   enabled: !kReleaseMode,
  //   builder: (context) => const App(),
  // ));
  runApp(const App());
}
