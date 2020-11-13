import 'package:bora_bebe/app/data/models/promocao.dart';
import 'package:get/get.dart';

class DetalhesPromocaoController extends GetxController {
  Promocao promocao;

  @override
  void onInit() {
    super.onInit();
    promocao = Get.arguments as Promocao;
    print(promocao);
  }
}
