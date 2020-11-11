import 'package:bora_bebe/app/data/models/cerveja.dart';
import 'package:bora_bebe/app/data/models/promocao.dart';
import 'package:bora_bebe/app/data/providers/ibge_api.dart';
import 'package:bora_bebe/app/data/providers/promocao_service.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddPromocaoController extends GetxController {
  final APIs _api = Get.find();
  final PromocaoService promocaoService = Get.find();

  final _promocao = Promocao().obs;
  Promocao get promocao => this._promocao.value;
  set promocao(value) => this._promocao.value = value;

  final dateFormat = DateFormat('dd/MM/yyyy');
  final moneyFormat = NumberFormat("#,##0.00", "pt_BR");
  final maskMoney = MoneyMaskedTextController(
      decimalSeparator: ',', thousandSeparator: '.'); //after

  @override
  void onInit() {
    super.onInit();
  }

  Future<List<Cerveja>> getCervejas() {
    return _api.getAllCervejas();
  }

  savePromocao() {}
}
