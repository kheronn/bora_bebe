import 'package:bora_bebe/app/modules/detalhes-promocao/controllers/detalhes_promocao_controller.dart';
import 'package:bora_bebe/app/modules/detalhes-promocao/widgets/body.dart';
import 'package:bora_bebe/app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetalhesPromocaoView extends GetView<DetalhesPromocaoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Body(
        promocao: controller.promocao,
      ),
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
      actions: <Widget>[
        PopupMenuButton(itemBuilder: (context) {
          return [
            CheckedPopupMenuItem(
              value: 5,
              child: Text('10 por página'),
            ),
            CheckedPopupMenuItem(
              value: 15,
              child: Text('25 por página'),
            ),
            CheckedPopupMenuItem(
              value: 30,
              child: Text('50 por página'),
            ),
          ];
        }),
        SizedBox(
          // It means 5 because by out defaultSize = 10
          width: 10,
        )
      ],
    );
  }
}
