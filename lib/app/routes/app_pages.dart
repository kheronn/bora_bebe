import 'package:bora_bebe/app/modules/add-promocao/bindings/add_promocao_binding.dart';
import 'package:bora_bebe/app/modules/add-promocao/views/add_promocao_view.dart';
import 'package:bora_bebe/app/modules/config_lugar/views/config_lugar_view.dart';
import 'package:bora_bebe/app/modules/config_lugar/bindings/config_lugar_binding.dart';
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
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.CONFIG_LUGAR,
      page: () => ConfigLugarView(),
      binding: ConfigLugarBinding(),
    ),
    GetPage(
      name: Routes.ADD_PROMOCAO,
      page: () => AddPromocaoView(),
      binding: AddPromocaoBinding(),
    ),
  ];
}
