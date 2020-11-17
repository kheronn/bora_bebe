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
  final _promocoes = List<Promocao>().obs;
  List<Promocao> get promocoes => _promocoes;

  final _limit = 10.obs;
  int get limit => _limit.value;
  set limit(value) => _limit.value = value;

  @override
  void onInit() async {
    super.onInit();
    _municipio.value = getStorage.read("municipio");
    _promocoes.bindStream(getAll());
    ever(_limit, (_) => getAll());
    usuario.value = authService.firebaseUser?.displayName;
  }

  Stream<List<Promocao>> getAll() =>
      _servicePromocao.getPromocoes(municipio, limit: limit);

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
