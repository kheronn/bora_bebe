import 'package:bora_bebe/app/data/providers/auth_service.dart';
import 'package:bora_bebe/app/shared/loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  AuthService authService = Get.find();

  Future<void> loginGoogle() async {
    try {
      Get.dialog(Center(child: LoadingWidget()), barrierDismissible: false);
      await authService.loginGoogle();
      Get.offAllNamed('/config-lugar');
    } catch (error) {
      Get.back();
      Get.snackbar("Erro ao logar", error.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  sair() {
    try {
      authService.signOut();
    } catch (e) {
      Get.snackbar("Erro ao sair", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
