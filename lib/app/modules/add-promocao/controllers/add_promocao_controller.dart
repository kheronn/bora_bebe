import 'package:bora_bebe/app/data/models/cerveja.dart';
import 'package:bora_bebe/app/data/models/municipio.dart';
import 'package:bora_bebe/app/data/providers/ibge_api.dart';
import 'package:get/get.dart';

class AddPromocaoController extends GetxController {
  final APIs _api = Get.find();

  @override
  void onInit() {}

  Future<List<Cerveja>> getCervejas() {
    return _api.getAllCervejas();
  }
}
