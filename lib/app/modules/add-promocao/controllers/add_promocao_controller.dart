import 'package:bora_bebe/app/data/models/cerveja.dart';
import 'package:bora_bebe/app/data/models/promocao.dart';
import 'package:bora_bebe/app/data/providers/ibge_api.dart';
import 'package:bora_bebe/app/data/providers/promocao_service.dart';
import 'package:bora_bebe/app/shared/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class AddPromocaoController extends GetxController {
  final APIs _api = Get.find();
  final PromocaoService promocaoService = Get.find();
  final getStorage = GetStorage();

  final _promocao = Promocao().obs;
  Promocao get promocao => this._promocao.value;
  set promocao(value) => this._promocao.value = value;

  final dateFormat = DateFormat('dd/MM/yyyy');
  final moneyFormat = NumberFormat("#,##0.00", "pt_BR");
  final maskMoney =
      MoneyMaskedTextController(decimalSeparator: ',', thousandSeparator: '.');
  final enderecoController = TextEditingController();

  @override
  Future<void> onInit() async {
    super.onInit();
    initialValues();
    final _position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    promocao.latitude = _position.latitude;
    promocao.longitude = _position.longitude;
    await _getAddress(_position);
  }

  void initialValues() {
    promocao.dataPromocao = DateTime.now();
    promocao.municipio = getStorage.read("municipio");
    promocao.volume = '300ml';
  }

  _getAddress(Position pos) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(pos.latitude, pos.longitude);
      promocao.endereco =
          placemarks[0].street + " nº " + placemarks[0].subThoroughfare;
      enderecoController.text = promocao.endereco;
    } catch (e) {
      print(e);
    }
  }

  Future<List<Cerveja>> getCervejas() {
    return _api.getAllCervejas();
  }

  savePromocao() async {
    Get.dialog(Center(child: LoadingWidget()), barrierDismissible: false);
    try {
      if (promocao.lugar.isNullOrBlank ||
          promocao.marca.isNullOrBlank ||
          promocao.preco.isNullOrBlank) {
        Get.back();
        showSnackBar(
            message: "Campos com * são obrigatórios!",
            color: Colors.red,
            icon: Icon(Icons.error));

        return;
      }
      promocaoService.add(promocao).then((value) => showSnackBar(
          message: "Promoção salva",
          color: Colors.blue,
          icon: Icon(Icons.save)));

      return Future.delayed(Duration(seconds: 2))
          .then((onValue) => Get.offNamed("/home"));
    } catch (erro) {
      showSnackBar(
          title: "Erro ao salvar",
          message: "Detalhes $erro",
          color: Colors.red,
          icon: Icon(Icons.error));
      Get.back();
    }
  }

  void showSnackBar({String title, String message, Color color, Icon icon}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      icon: icon,
      backgroundColor: color.withOpacity(.75),
      duration: Duration(seconds: 4),
      colorText: Colors.white,
      borderRadius: 25,
      shouldIconPulse: true,
      barBlur: 20,
    );
  }
}
