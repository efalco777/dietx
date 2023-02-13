import 'package:dietx/app/app.dart';
import 'package:dietx/app/assets/library_assets.dart';
import 'package:dietx/app/di/di.dart';
import 'package:dietx/app/firebase/firebase_options.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await _initializeAndLaunchApp();
}

Future<void> _initializeAndLaunchApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await configureDependencies();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('pl'),
      ],
      path: LibraryAssets.getPath('translations'),
      fallbackLocale: const Locale('en'),
      child: const DietXApp(),
    ),
  );
}
