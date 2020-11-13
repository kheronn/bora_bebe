import 'package:bora_bebe/app/data/models/promocao.dart';
import 'package:bora_bebe/app/modules/detalhes-promocao/widgets/promocao_geral.dart';
import 'package:bora_bebe/app/modules/detalhes-promocao/widgets/promocao_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  final Promocao promocao;

  const Body({Key key, this.promocao}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double defaultSize = Get.context.orientation == Orientation.landscape
        ? Get.context.height * 0.024
        : Get.context.width * 0.024;
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        height: Get.context.orientation == Orientation.landscape
            ? Get.context.width
            : Get.context.height - AppBar().preferredSize.height,
        child: Stack(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            PromocaoInfo(product: promocao),
            Positioned(
              top: defaultSize * 37.5,
              left: 0,
              right: 0,
              child: PromocaoGeral(
                promocao: promocao,
                press: () {},
              ),
            ),
            Positioned(
              top: defaultSize * 9.5,
              right: defaultSize * 2.5,
              child: Hero(
                tag: promocao.id,
                child: Container(
                  child: Image.network(promocao.marcaImagem,
                      fit: BoxFit.cover,
                      height: defaultSize * 37.8,
                      width: defaultSize * 16.4),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
