import 'package:bora_bebe/app/data/models/promocao.dart';
import 'package:bora_bebe/app/modules/detalhes-promocao/controllers/detalhes_promocao_controller.dart';
import 'package:bora_bebe/app/modules/detalhes-promocao/widgets/promocao_geral.dart';
import 'package:bora_bebe/app/modules/detalhes-promocao/widgets/promocao_info.dart';
import 'package:bora_bebe/app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:get/get.dart';

class Body extends GetView<DetalhesPromocaoController> {
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
            PromocaoInfo(promocao: promocao),
            Positioned(
              top: defaultSize * 35.5,
              left: 0,
              right: 0,
              child: PromocaoGeral(
                promocao: promocao,
                press: () {
                  Get.dialog(
                    Stack(
                      children: [
                        Card(
                          child: FlutterMap(
                            options: new MapOptions(
                              boundsOptions: FitBoundsOptions(
                                  padding: EdgeInsets.all(8.0)),
                              center: new LatLng(
                                  promocao.latitude, promocao.longitude),
                              zoom: 16.0,
                            ),
                            layers: [
                              new TileLayerOptions(
                                  urlTemplate:
                                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                                  subdomains: ['a', 'b', 'c']),
                              new MarkerLayerOptions(
                                markers: [
                                  new Marker(
                                    width: 30.0,
                                    height: 30.0,
                                    point: new LatLng(
                                        promocao.latitude, promocao.longitude),
                                    builder: (ctx) => new Container(
                                      child: Image(
                                          image: AssetImage(
                                              "assets/images/beer.png"),
                                          width: 20.0),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 8),
                            child: Card(
                              //  margin: EdgeInsets.all(defaultSize * 1.5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              color: primaryColor,
                              child: ListTile(
                                leading: Image(
                                    image: AssetImage("assets/images/beer.png"),
                                    width: 35.0),
                                title: Text(
                                  promocao.endereco,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  "Você está aproximadamente ${controller?.distance?.round()} metros.",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                                trailing: Icon(Icons.close_outlined),
                                onTap: () => Get.back(),
                              ),
                            )),
                      ],
                    ),
                  );
                },
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
