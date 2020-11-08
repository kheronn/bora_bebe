import 'package:bora_bebe/app/data/estados.dart';
import 'package:bora_bebe/app/shared/loading_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:dio/dio.dart';

class LoginController extends GetxController {
  FirebaseApp firebaseApp;
  User firebaseUser;
  FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final box = GetStorage();
  final estadoSelecionado = Estados().obs;
  final estados = List<Estados>().obs;

  Future<void> initlizeFirebaseApp() async {
    firebaseApp = await Firebase.initializeApp();
  }

  Future<String> checkUserLoggedIn() async {
    if (firebaseApp == null) {
      await initlizeFirebaseApp();
    }
    if (firebaseAuth == null) {
      firebaseAuth = FirebaseAuth.instance;
      update();
    }
    if (firebaseAuth.currentUser == null) {
      return '/login';
    } else {
      firebaseUser = firebaseAuth.currentUser;
      update();
      return '/home';
    }
  }

  @override
  void onInit() async {
    super.onInit();
  }

  void loginGoogle() async {
    try {
      Get.dialog(Center(child: LoadingWidget()), barrierDismissible: false);
      await initlizeFirebaseApp();

      firebaseAuth = FirebaseAuth.instance;
      final googleUser = await googleSignIn.signIn();
      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredentialData =
          await FirebaseAuth.instance.signInWithCredential(credential);
      firebaseUser = userCredentialData.user;

      update();
      Get.back();
      Get.offAllNamed('/home');
    } catch (e) {
      Get.back();
      Get.snackbar("Erro ao logar", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<List<Estados>> getEstados() {
    return Dio()
        .get("https://servicodados.ibge.gov.br/api/v1/localidades/estados")
        .then(
          (res) => res?.data
              ?.map<Estados>(
                (u) => Estados.fromMap(u),
              )
              ?.toList(),
        );
  }

  void sair() async {
    try {
      await firebaseAuth.signOut();
      Get.offAllNamed("login");
    } catch (e) {
      Get.snackbar("Erro ao sair", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
