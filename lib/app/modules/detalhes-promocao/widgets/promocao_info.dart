import 'package:bora_bebe/app/data/models/promocao.dart';
import 'package:bora_bebe/app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PromocaoInfo extends StatelessWidget {
  PromocaoInfo({
    Key key,
    @required this.promocao,
  }) : super(key: key);

  final Promocao promocao;
  final moneyFormat = NumberFormat("#,##0.00", "pt_BR");

  @override
  Widget build(BuildContext context) {
    double defaultSize = Get.context.orientation == Orientation.landscape
        ? Get.context.height * 0.024
        : Get.context.width * 0.024;
    TextStyle lightTextStyle =
        TextStyle(color: secondaryColor.withOpacity(0.6));
    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultSize * 2),
      height: defaultSize * 37.5, //375
      width: defaultSize *
          (Get.context.orientation == Orientation.landscape ? 35 : 15), //150
      // color: Colors.black45,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(promocao.marca.toUpperCase(), style: lightTextStyle),
            SizedBox(height: defaultSize),
            Text(
              promocao.lugar.toUpperCase(),
              style: TextStyle(
                fontSize: defaultSize * 2.4, //24
                fontWeight: FontWeight.bold,
                letterSpacing: -0.8,
                height: 1.4,
              ),
            ),
            SizedBox(height: defaultSize * 2),
            Text("Valor", style: lightTextStyle),
            Text(
              "R\$${moneyFormat.format(promocao.preco)}",
              style: TextStyle(
                fontSize: 20, //16
                fontWeight: FontWeight.bold,
                height: 1.6,
              ),
            ),
            SizedBox(height: defaultSize * 2), //20
          ],
        ),
      ),
    );
  }
}
