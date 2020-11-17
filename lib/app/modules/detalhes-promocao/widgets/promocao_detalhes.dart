import 'package:bora_bebe/app/modules/detalhes-promocao/controllers/detalhes_promocao_controller.dart';
import 'package:bora_bebe/app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:intl/intl.dart';
import 'package:latlong/latlong.dart';

class PromocaoDetalhes extends GetView<DetalhesPromocaoController> {
  final moneyFormat = NumberFormat("#,##0.00", "pt_BR");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 300.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: darkColor.withOpacity(.5),
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.black45,
                            offset: Offset(0.0, 10.0),
                            blurRadius: 10.0)
                      ]),
                ),
                Hero(
                  tag: controller.promocao.id,
                  child: Container(
                    alignment: FractionalOffset.centerLeft,
                    child: Image.network(
                      controller.promocao.marcaImagem,
                      height: 280,
                      width: 180,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 150.0, top: 30.0, right: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        controller.promocao.marca +
                            " " +
                            controller.promocao.volume,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        controller.promocao.lugar,
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 13.0,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      FlatButton(
                          onPressed: null,
                          child: Text(
                            "R\$ ${moneyFormat.format(controller.promocao.preco)}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                        height: 35.0,
                      ),
                      FlatButton(
                        padding: EdgeInsets.all(1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        color: primaryColor,
                        onPressed: () {
                          _showMapa();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.place_outlined,
                              color: Colors.white70,
                            ),
                            SizedBox(width: 20),
                            Text(
                              "MAPA",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      FlatButton(
                        padding: EdgeInsets.all(1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        color: Colors.green[300],
                        onPressed: () {
                          controller.share();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.share_outlined,
                              color: Colors.white70,
                            ),
                            SizedBox(width: 20),
                            Text(
                              "COMPARTILHAR",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showMapa() {
    Get.dialog(
      Stack(
        children: [
          Card(
            child: FlutterMap(
              options: new MapOptions(
                boundsOptions: FitBoundsOptions(padding: EdgeInsets.all(8.0)),
                center: new LatLng(controller.promocao.latitude,
                    controller.promocao.longitude),
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
                      point: new LatLng(controller.promocao.latitude,
                          controller.promocao.longitude),
                      builder: (ctx) => new Container(
                        child: Image(
                            image: AssetImage("assets/images/beer.png"),
                            width: 20.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Card(
                //  margin: EdgeInsets.all(defaultSize * 1.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                color: primaryColor,
                child: ListTile(
                  leading: Image(
                      image: AssetImage("assets/images/beer.png"), width: 35.0),
                  title: Text(
                    controller.promocao.endereco,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    "Você está aproximadamente ${controller?.distance?.round()} metros.",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  trailing: Icon(Icons.close_outlined),
                  onTap: () => Get.back(),
                ),
              )),
        ],
      ),
    );
  }
}
