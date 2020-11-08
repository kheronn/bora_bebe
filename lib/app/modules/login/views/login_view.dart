import 'package:bora_bebe/app/data/estados.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bora_bebe/app/modules/login/controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                  image: AssetImage("assets/images/logo_circle.png"),
                  width: 400),
              _comboEstados(),
              _botaoLogin(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _botaoLogin() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
        controller.loginGoogle();
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
                image: AssetImage("assets/images/google_logo.png"), height: 35),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Logar com o  Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _comboEstados() {
    return DropdownSearch<Estados>(
      mode: Mode.DIALOG,
      label: "Estado",
      onFind: (String filter) => controller.getEstados(),
      onChanged: (Estados data) {
        print(data);
        controller.estadoSelecionado.value = data;
        print(controller.estadoSelecionado.value);
      },
    );
  }
}
