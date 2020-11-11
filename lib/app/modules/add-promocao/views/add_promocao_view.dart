import 'package:bora_bebe/app/data/models/cerveja.dart';
import 'package:bora_bebe/app/modules/add-promocao/controllers/add_promocao_controller.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddPromocaoView extends GetView<AddPromocaoController> {
  final _dateFormat = DateFormat('dd/MM/yyyy');
  final _moneyFormat = NumberFormat("#,##0.00", "pt_BR");
  final _maskMoney = MoneyMaskedTextController(
      decimalSeparator: ',', thousandSeparator: '.'); //after

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
        floatingActionButton: _buildFloatingActionButton(),
        body: SafeArea(
          bottom: true,
          top: true,
          child: Form(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: const Icon(Icons.pin_drop),
                    hintText: 'Nome do local',
                    labelText: 'Nome do Local*',
                  ),
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
                    print(data);
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
                          onChanged: (String data) {
                            print(data);
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: TextFormField(
                        controller: _maskMoney,
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
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                DateTimeField(
                    format: _dateFormat,
                    decoration: InputDecoration(
                        labelText: "Data final da promoção",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                    // initialValue: DateTime.,
                    onShowPicker: (context, currentValue) {
                      return showDatePicker(
                        context: context,
                        // firstDate: DateTime.now(),
                        //  initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2100), firstDate: DateTime.now(),
                        initialDate: DateTime.now(),
                      );
                    }),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Theme.of(context).primaryColor,
                  ),
                )
              ],
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
            Get.back();
          },
        ),
      ),
    );
  }

  Future _chooseDate() async {
    var now = new DateTime.now();

    var result = await showDatePicker(
        initialDate: now,
        firstDate: now,
        lastDate: new DateTime(2100),
        context: Get.context);

    if (result == null) return;
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
