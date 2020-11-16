import 'package:bora_bebe/app/modules/detalhes-promocao/controllers/detalhes_promocao_controller.dart';
import 'package:bora_bebe/app/modules/detalhes-promocao/widgets/body.dart';
import 'package:bora_bebe/app/modules/detalhes-promocao/widgets/promocao_detalhes.dart';
import 'package:bora_bebe/app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetalhesPromocaoView extends GetView<DetalhesPromocaoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: PromocaoDetalhes(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      backgroundColor: primaryColor,
      toolbarHeight: 65,
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          "assets/images/logo_circle_bar.png",
          height: 60,
        ),
      ),
    );
  }
}
