import 'package:bora_bebe/app/modules/login/bindings/login_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();

  runApp(
    GetMaterialApp(
      title: "Bora Bebe",
      initialBinding: LoginBinding(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: AppPages.routes,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('pt', 'BR')],
    ),
  );
}
