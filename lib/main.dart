import 'package:bora_bebe/app/modules/login/bindings/login_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    GetMaterialApp(
      title: "Bora Bebe",
      initialBinding: LoginBinding(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: AppPages.routes,
    ),
  );
}
