import 'dart:async';
import 'package:bora_bebe/app/modules/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends GetView<LoginController> {
  SplashView() {
    startTimeout();
  }

  startTimeout() async {
    return Timer(Duration(seconds: 5), changeScreen);
  }

  changeScreen() async {
    await controller.user.isNullOrBlank
        ? Get.toNamed('/login')
        : Get.toNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFff5757),
      body: Stack(
        children: [
          _buildLogo(),
          Center(
            child: Container(
              height: 65,
              width: 65,
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Center(
      child: Container(
        height: Get.context.height * 0.7,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          image: new DecorationImage(
            image: new AssetImage('assets/images/logo.png'),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
