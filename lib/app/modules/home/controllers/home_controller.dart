import 'package:bora_bebe/app/data/models/promocao.dart';
import 'package:bora_bebe/app/data/providers/promocao_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final getStorage = GetStorage();
  final _municipio = "".obs;
  String get municipio => this._municipio.value;

  final _servicePromocao = Get.find<PromocaoService>();
  final _promocoes = List<Promocao>().obs;
  List<Promocao> get promocoes => _promocoes;

  @override
  void onInit() async {
    super.onInit();
    _municipio.value = getStorage.read("municipio");
    print(municipio);
    _promocoes.bindStream(_servicePromocao.getPromocoes(municipio));
    print(promocoes.length);
  }

  @override
  void onReady() {
    super.onReady();
    if (getStorage.read("municipio") == null) {
      Get.offAllNamed('/config-lugar');
    } else {
      _municipio.value = getStorage.read("municipio");
    }
  }
}
