import 'package:bora_bebe/app/data/models/municipio.dart';
import 'package:bora_bebe/app/data/models/uf.dart';
import 'package:bora_bebe/app/data/providers/ibge_api.dart';
import 'package:bora_bebe/app/shared/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ConfigLugarController extends GetxController {
  final IbgeAPI _api;
  final box = GetStorage();
  final _estadoSelecionado = Uf().obs;
  int get estadoSelecionado => _estadoSelecionado.value.id;
  set estadoSelecionado(value) => this._estadoSelecionado.value.id = value;
  final _municipioSelecionado = Municipio().obs;
  set municipioSelecionado(value) =>
      this._municipioSelecionado.value.nome = value;
  String get municipioSelecionado =>
      this._municipioSelecionado?.value.nome == null
          ? ''
          : this._municipioSelecionado.value.nome.toUpperCase();

  ConfigLugarController(this._api);

  @override
  Future<void> onInit() async {
    ever(_estadoSelecionado, (_) => getMunicipios());

    //await getUfs();
  }

  Future<List<Uf>> getUfs() {
    return _api.getUfs();
  }

  Future<List<Municipio>> getMunicipios() {
    print("Cgamou o getMunicipio $estadoSelecionado");
    return _api.getMunicipios(estadoSelecionado.toString());
  }

  void salvar() async {
    Get.dialog(Center(child: LoadingWidget()), barrierDismissible: false);
    if (municipioSelecionado.isNullOrBlank) {
      Get.back();
      messageErro(
          title: "Atenção",
          message: "Selecione um Município para continuar",
          color: Colors.red);
    } else {
      await box.write('municipio', municipioSelecionado);
      Get.back();
      Get.offAllNamed('/home');
    }
  }

  messageErro({String title, String message, Color color}) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: color,
        duration: Duration(seconds: 4),
        colorText: Colors.white);
  }
}
