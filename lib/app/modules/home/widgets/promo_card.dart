import 'package:bora_bebe/app/data/models/promocao.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PromoCard extends StatelessWidget {
  PromoCard({
    this.promocao,
    this.press,
  });
  final moneyFormat = NumberFormat("#,##0.00", "pt_BR");
  final Promocao promocao;
  final Function press;

  @override
  Widget build(BuildContext context) {
    double defaultSize = Get.context.orientation == Orientation.landscape
        ? Get.context.height * 0.024
        : Get.context.width * 0.024;
    return GestureDetector(
      onTap: press,
      child: Container(
        width: defaultSize * 11.5, //145
        decoration: BoxDecoration(
          color: Colors.white60,
          borderRadius: BorderRadius.circular(30),
        ),
        child: AspectRatio(
          aspectRatio: 0.693,
          child: Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1,
                child: Hero(
                  tag: promocao.id,
                  child: FadeInImage.assetNetwork(
                    placeholder: "assets/images/spinner.gif",
                    image: promocao.marcaImagem,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultSize),
                child: Text(
                  "${promocao.marca}  ${promocao.volume}",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: defaultSize * 1.4, //16
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: defaultSize / 2),
              Text(
                promocao.lugar.toUpperCase(),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: defaultSize / 2),
              Text(
                "R\$${moneyFormat.format(promocao.preco)}",
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
