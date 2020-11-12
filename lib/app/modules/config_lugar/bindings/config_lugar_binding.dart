import 'package:get/get.dart';

import 'package:bora_bebe/app/modules/config_lugar/controllers/config_lugar_controller.dart';

class ConfigLugarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConfigLugarController>(
      () => ConfigLugarController(Get.find()),
    );
  }
}
