import 'package:bora_bebe/app/data/models/promocao.dart';
import 'package:bora_bebe/app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PromocaoGeral extends StatelessWidget {
  const PromocaoGeral({
    Key key,
    @required this.promocao,
    this.press,
  }) : super(key: key);

  final Promocao promocao;
  final Function press;

  @override
  Widget build(BuildContext context) {
    double defaultSize = Get.context.orientation == Orientation.landscape
        ? Get.context.height * 0.024
        : Get.context.width * 0.024;
    return Container(
      constraints: BoxConstraints(minHeight: defaultSize * 44),
      padding: EdgeInsets.only(
        top: defaultSize * 9, //90
        left: defaultSize * 2, //20
        right: defaultSize * 2,
      ),
      // height: 500,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(defaultSize * 1.2),
          topRight: Radius.circular(defaultSize * 1.2),
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              promocao.marca.toUpperCase() + " " + promocao.volume,
              style: TextStyle(
                fontSize: defaultSize * 1.8,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: defaultSize * 3),
            Text(
              promocao.endereco,
              style: TextStyle(
                color: secondaryColor.withOpacity(0.7),
                height: 1.5,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: FlatButton(
                padding: EdgeInsets.all(defaultSize * 1.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                color: primaryColor,
                onPressed: press,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.place_outlined,
                      color: Colors.white70,
                    ),
                    SizedBox(width: 20),
                    Text(
                      "VER NO MAPA",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
