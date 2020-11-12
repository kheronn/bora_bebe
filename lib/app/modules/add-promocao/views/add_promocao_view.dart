import 'package:bora_bebe/app/data/models/cerveja.dart';
import 'package:bora_bebe/app/modules/add-promocao/controllers/add_promocao_controller.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPromocaoView extends GetView<AddPromocaoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text("Compartilhe a Promoção"),
          centerTitle: true,
          backgroundColor: Colors.red[400],
          actions: [
            IconButton(
              icon: Icon(Icons.image_search_rounded),
              onPressed: () {},
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: _buildFloatingActionButton(),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Form(
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: EdgeInsets.all(16),
                children: [
                  TextFormField(
                    autofocus: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      prefixIcon: const Icon(Icons.pin_drop),
                      hintText: 'Nome do local',
                      labelText: 'Nome do Local*',
                    ),
                    onChanged: (lugar) => controller.promocao.lugar = lugar,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: controller.enderecoController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      prefixIcon: const Icon(Icons.place_rounded),
                      hintText: 'Endereço:',
                      labelText: '',
                    ),
                    onChanged: (endereco) =>
                        controller.promocao.endereco = endereco,
                  ),
                  SizedBox(height: 10),
                  DropdownSearch<Cerveja>(
                    mode: Mode.DIALOG,
                    showSearchBox: true,
                    hint: "Nome da cerveja",
                    label: "Cervejas",
                    dropdownSearchDecoration: _buildInputDecoration(),
                    onFind: (String filter) => controller.getCervejas(),
                    onChanged: (Cerveja data) {
                      controller.promocao.marca = data.marca;
                    },
                    dropdownBuilder: _customDropDownExample,
                    popupItemBuilder: _customPopupItemBuilderExample2,
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Flexible(
                          child: DropdownSearch<String>(
                            mode: Mode.MENU,
                            items: [
                              "300ml",
                              "473ml",
                              "600ml",
                              "1L",
                              "5L",
                              "15L",
                            ],
                            label: "Volume",
                            selectedItem: "300ml",
                            dropdownSearchDecoration: _buildInputDecoration(),
                            onChanged: (String volume) {
                              controller.promocao.volume = volume;
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: TextFormField(
                          controller: controller.maskMoney,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(0, 35, 0, 30),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            prefixIcon: const Icon(Icons.money),
                            hintText: "0,00",
                            labelText: 'Preço*',
                          ),
                          onChanged: (preco) => controller.promocao.preco =
                              controller.maskMoney.numberValue,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  DateTimeField(
                      format: controller.dateFormat,
                      decoration: InputDecoration(
                          labelText: "Data final da promoção",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                      // initialValue: DateTime.,
                      onShowPicker: (context, currentValue) async {
                        final dataExpira = await showDatePicker(
                          context: context,
                          // firstDate: DateTime.now(),
                          //  initialDate: currentValue ?? DateTime.now(),
                          lastDate: DateTime(2100), firstDate: DateTime.now(),
                          initialDate: DateTime.now(),
                        );
                        return controller.promocao.dataExpira = dataExpira;
                      }),
                  SizedBox(height: 10)
                ],
              ),
            ),
          ),
        ));
  }

  InputDecoration _buildInputDecoration() {
    return InputDecoration(
        border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
    ));
  }

  _buildFloatingActionButton() {
    return SizedBox(
      height: 100,
      width: 100,
      child: Container(
        child: FloatingActionButton(
          elevation: 5,
          backgroundColor: Colors.red[200],
          isExtended: true,
          child: Image(
              image: AssetImage("assets/images/beer_add.png"), width: 115.0),
          onPressed: () {
            controller.savePromocao();
            //Get.back();
          },
        ),
      ),
    );
  }

  Widget _customDropDownExample(
      BuildContext context, Cerveja item, String itemDesignation) {
    return Container(
      child: (item?.imagem == null)
          ? ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  backgroundImage: AssetImage("assets/images/beer_add.png")),
              title: Text("Nenhum item selecionado"),
            )
          : ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: CircleAvatar(
                backgroundColor: Colors.red,
                backgroundImage: NetworkImage(item.imagem),
              ),
              title: Text(item.marca.toUpperCase()),
              subtitle: Text(
                item.tipo.toUpperCase(),
              ),
            ),
    );
  }

  Widget _customPopupItemBuilderExample2(
      BuildContext context, Cerveja item, bool isSelected) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: !isSelected
          ? null
          : BoxDecoration(
              border: Border.all(color: Colors.transparent),
              borderRadius: BorderRadius.circular(5),
              color: Colors.red,
            ),
      child: ListTile(
        selected: isSelected,
        title: Text(item.marca.toUpperCase()),
        subtitle: Text(item.tipo),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(item.imagem),
        ),
      ),
    );
  }
}
