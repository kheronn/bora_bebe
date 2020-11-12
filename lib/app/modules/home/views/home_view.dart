import 'package:bora_bebe/app/modules/home/widgets/promocoes_recentes.dart';
import 'package:bora_bebe/app/shared/constants.dart';
import 'package:bora_bebe/app/shared/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bora_bebe/app/modules/home/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(),
      floatingActionButton: _buildFloatingActionButton(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Obx(() {
              if (controller.promocoes.isEmpty) {
                return Center(child: LoadingWidget());
              }
              return PromocoesRecentes(controller.promocoes);
            }),
          ),
        ),
      ),
    );
  }

  _buildFloatingActionButton() {
    return SizedBox(
      height: 100,
      width: 100,
      child: Container(
        child: FloatingActionButton(
          backgroundColor: kPrimaryColor,
          child:
              Image(image: AssetImage("assets/images/beer.png"), width: 60.0),
          onPressed: () {
            Get.toNamed('/add-promocao');
          },
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor,
      toolbarHeight: 65,
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {},
      ),
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Image.asset(
          "assets/images/logo_circle.png",
          height: 110,
        ),
      ),
      actions: <Widget>[
        PopupMenuButton(itemBuilder: (context) {
          return [
            CheckedPopupMenuItem(
              value: 5,
              child: Text('5 por página'),
            ),
            CheckedPopupMenuItem(
              value: 15,
              child: Text('15 por página'),
            ),
            CheckedPopupMenuItem(
              value: 30,
              child: Text('30 por página'),
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
