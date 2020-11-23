import 'package:bora_bebe/app/data/models/promocao.dart';
import 'package:bora_bebe/app/data/providers/auth_service.dart';
import 'package:bora_bebe/app/data/providers/promocao_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  AuthService authService = Get.find();
  final usuario = "".obs;

  final getStorage = GetStorage();
  final _municipio = "".obs;
  String get municipio => this._municipio.value;

  final _servicePromocao = Get.find<PromocaoService>();
  Rx<List<Promocao>> _promocoes = Rx<List<Promocao>>();
  List<Promocao> get promocoes => _promocoes.value;

  final _limit = 0.obs;
  int get limit => _limit.value;
  set limit(value) => _limit.value = value;

  @override
  void onInit() async {
    super.onInit();
    _municipio.value = getStorage.read("municipio");
    ever(_limit, (_) => getAll());
    limit = 10;
    usuario.value = authService.firebaseUser?.displayName;
  }

  void getAll() {
    _promocoes
        .bindStream(_servicePromocao.getPromocoes(municipio, limit: limit));
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
