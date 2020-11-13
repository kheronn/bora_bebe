import 'package:bora_bebe/app/data/models/promocao.dart';
import 'package:bora_bebe/app/modules/home/widgets/promo_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PromocoesRecentes extends StatelessWidget {
  final List<Promocao> listPromocoes;

  PromocoesRecentes(this.listPromocoes);
  @override
  Widget build(BuildContext context) {
    double defaultSize = Get.context.orientation == Orientation.landscape
        ? Get.context.height * 0.024
        : Get.context.width * 0.024;

    return Padding(
      padding: EdgeInsets.all(defaultSize * 2), //20
      child: GridView.builder(
        // We just turn off grid view scrolling
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        // just for demo
        itemCount: listPromocoes.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              Get.context.orientation == Orientation.portrait ? 2 : 4,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 0.693,
        ),
        itemBuilder: (context, index) => PromoCard(
            promocao: listPromocoes[index],
            press: () {
              print("press");
            }),
      ),
    );
  }
}
