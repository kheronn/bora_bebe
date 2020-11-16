import 'package:bora_bebe/app/data/models/promocao.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class DetalhesPromocaoController extends GetxController {
  Promocao promocao;
  double distance;

  @override
  Future<void> onInit() async {
    super.onInit();
    promocao = Get.arguments as Promocao;
    final _position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    distance = Geolocator.distanceBetween(_position.latitude,
        _position.longitude, promocao.latitude, promocao.longitude);
  }
}
