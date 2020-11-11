import 'package:bora_bebe/app/modules/add-promocao/controllers/add_promocao_controller.dart';
import 'package:get/get.dart';

class AddPromocaoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddPromocaoController>(
      () => AddPromocaoController(),
    );
  }
}
