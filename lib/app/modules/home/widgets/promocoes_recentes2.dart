import 'package:bora_bebe/app/data/models/promocao.dart';
import 'package:bora_bebe/app/modules/home/widgets/promo_card2.dart';
import 'package:flutter/material.dart';

class PromocoesRecentes2 extends StatelessWidget {
  final List<Promocao> listPromocoes;

  PromocoesRecentes2(this.listPromocoes);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        height: 550,
        margin: EdgeInsets.only(top: 50),
        child: Row(
          children: List.generate(
            listPromocoes.length,
            (index) => PromoCard2(listPromocoes[index]),
          ),
        ),
      ),
    );
  }
}
