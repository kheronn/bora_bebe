import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final getStorage = GetStorage();
  final _municipio = "".obs;
  String get municipio => this._municipio.value;

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
