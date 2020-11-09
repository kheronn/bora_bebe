import 'package:bora_bebe/app/data/models/municipio.dart';
import 'package:bora_bebe/app/data/models/uf.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bora_bebe/app/modules/config_lugar/controllers/config_lugar_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfigLugarView extends GetView<ConfigLugarController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: _buildFundoGradiente(),
        child: Container(
          margin: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                  image: AssetImage("assets/images/location.png"), width: 150),
              _texto(),
              SizedBox(
                height: 20,
              ),
              _comboEstados(),
              SizedBox(
                height: 30,
              ),
              _comboMunicipios(),
              SizedBox(
                height: 30,
              ),
              _buildRoundedButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _texto() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Text(
        'Selecione seu lugar',
        textAlign: TextAlign.center,
        style: GoogleFonts.lato(
            color: Colors.black87, fontSize: 30, fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget _comboEstados() {
    return DropdownSearch<Uf>(
      mode: Mode.DIALOG,
      showSearchBox: true,
      label: "UF",
      onFind: (String filter) => controller.getUfs(),
      onChanged: (Uf data) {
        print(data.id);
        controller.estadoSelecionado = data.id;
      },
    );
  }

  Widget _comboMunicipios() {
    return DropdownSearch<Municipio>(
      mode: Mode.DIALOG,
      showSearchBox: true,
      label: "Município",
      autoValidateMode: AutovalidateMode.onUserInteraction,
      onFind: (String filter) => controller.getMunicipios(),
      onChanged: (Municipio data) {
        controller.municipioSelecionado = data.nome;
      },
    );
  }

  _buildRoundedButton() {
    return Padding(
      padding: EdgeInsets.all(1),
      child: InkWell(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Get.context.theme.primaryColor,
          ),
          height: 50,
          child: Center(
            child: Text(
              "Salvar",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        onTap: () {
          controller.salvar();
        },
      ),
    );
  }

  BoxDecoration _buildFundoGradiente() {
    return BoxDecoration(
      gradient: LinearGradient(
          begin: const FractionalOffset(0.5, 0.0),
          end: const FractionalOffset(0.0, 0.5),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
          colors: [Colors.white54, Colors.lightBlue.shade100]),
    );
  }
}
