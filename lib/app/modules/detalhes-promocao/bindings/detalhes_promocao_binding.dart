import 'package:bora_bebe/app/modules/detalhes-promocao/controllers/detalhes_promocao_controller.dart';
import 'package:get/get.dart';

class DetalhesPromocaoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetalhesPromocaoController>(
      () => DetalhesPromocaoController(),
    );
  }
}
