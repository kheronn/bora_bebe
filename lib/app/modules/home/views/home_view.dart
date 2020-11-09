import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bora_bebe/app/modules/home/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 120,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0.0,
        brightness: Brightness.dark,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Image(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/logo_circle.png"),
              width: 200),
        ),
      ),
      floatingActionButton: _buildFloatingActionButton(),
      body: Center(
        child: Obx(() => Text(
              controller.municipio,
              style: TextStyle(fontSize: 20),
            )),
      ),
    );
  }

  _buildFloatingActionButton() {
    return FloatingActionButton(
      child: Image(image: AssetImage("assets/images/beer.png"), width: 60.0),
      onPressed: () {},
    );
  }
}
