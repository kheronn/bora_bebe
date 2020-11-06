import 'package:bora_bebe/app/modules/login/views/login_view.dart';
import 'package:bora_bebe/app/modules/login/bindings/login_binding.dart';
import 'package:bora_bebe/app/modules/home/views/home_view.dart';
import 'package:bora_bebe/app/modules/home/bindings/home_binding.dart';
import 'package:bora_bebe/app/modules/home/views/splah_view.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: "/",
      page: () => SplashView(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.LOGIN, 
      page:()=> LoginView(), 
      binding: LoginBinding(),
    ),
  ];
}