import 'package:bora_bebe/app/data/models/promocao.dart';
import 'package:bora_bebe/app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PromoCard2 extends StatelessWidget {
  PromoCard2(
    this.promocao,
  );
  final moneyFormat = NumberFormat("#,##0.00", "pt_BR");
  final Promocao promocao;

  @override
  Widget build(BuildContext context) {
    double defaultSize = Get.context.orientation == Orientation.landscape
        ? Get.context.height * 0.024
        : Get.context.width * 0.024;
    return Padding(
      padding: EdgeInsets.all(defaultSize * 2), //20
      child: SizedBox(
        width: defaultSize * 20.5, //205
        child: AspectRatio(
          aspectRatio: 0.83,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              // This is custom Shape thats why we need to use ClipPath
              ClipPath(
                clipper: CategoryCustomShape(),
                child: AspectRatio(
                  aspectRatio: 1.025,
                  child: Container(
                    padding: EdgeInsets.all(defaultSize * 2),
                    color: kSecondaryColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(promocao.marca ?? ''),
                        SizedBox(height: defaultSize),
                        Text(
                          "${promocao.preco.toString()}",
                          style: TextStyle(
                            color: kTextColor.withOpacity(0.6),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: AspectRatio(
                  aspectRatio: 1.15,
                  child: FadeInImage.assetNetwork(
                    placeholder: "assets/images/spinner.gif",
                    image: promocao.marcaImagem,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryCustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double height = size.height;
    double width = size.width;
    double cornerSize = 30;

    path.lineTo(0, height - cornerSize);
    path.quadraticBezierTo(0, height, cornerSize, height);
    path.lineTo(width - cornerSize, height);
    path.quadraticBezierTo(width, height, width, height - cornerSize);
    path.lineTo(width, cornerSize);
    path.quadraticBezierTo(width, 0, width - cornerSize, 0);
    path.lineTo(cornerSize, cornerSize * 0.75);
    path.quadraticBezierTo(0, cornerSize, 0, cornerSize * 2);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
