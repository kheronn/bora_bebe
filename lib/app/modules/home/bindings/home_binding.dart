import 'package:bora_bebe/app/data/providers/ibge_api.dart';
import 'package:bora_bebe/app/data/providers/promocao_service.dart';
import 'package:get/get.dart';

import 'package:bora_bebe/app/modules/home/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut(() => PromocaoService(), fenix: true);
  }
}
