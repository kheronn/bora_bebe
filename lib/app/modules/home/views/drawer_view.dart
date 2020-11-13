import 'package:bora_bebe/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
                color: Colors.red[400],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                )),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: CircleAvatar(
                    backgroundImage:
                        AssetImage("assets/images/logo_circle.png"),
                    radius: 80.0,
                  ),
                ),
                SizedBox(height: 50),
                Align(
                  alignment: Alignment.centerRight + Alignment(0, .8),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        controller.municipio,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Obx(() => ListTile(
                leading: Icon(Icons.person),
                title: Text(controller.usuario.value),
                onTap: () {
                  controller.authService.signOut();
                },
              )),
          ListTile(
            leading: Icon(Icons.work),
            title: Text('Encerrar sessão'),
            onTap: () {
              controller.authService.signOut();
            },
            trailing: Icon(Icons.logout),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text(
              'Aplicativo desenvolvido para compartilhamento de promoções de cervejas.',
              textAlign: TextAlign.justify,
              overflow: TextOverflow.visible,
            ),
          ),
        ],
      ),
    );
  }
}
