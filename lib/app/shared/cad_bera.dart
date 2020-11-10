import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CadBera extends StatelessWidget {
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
                DropdownSearch<String>(
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
                SizedBox(height: 10),
                TextFormField(
                  controller: _maskMoney,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: const Icon(Icons.money),
                    hintText: "0,00",
                    labelText: 'Preço*',
                  ),
                ),
                SizedBox(height: 10),
                Row(children: <Widget>[
                  new Expanded(
                      child: new TextFormField(
                    onTap: () {
                      _chooseDate();
                    },
                    decoration: new InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      prefixIcon: const Icon(Icons.calendar_today),
                      hintText: '',
                      labelText: 'Data final da promoção',
                    ),
                    keyboardType: TextInputType.datetime,
                  )),
                ]),
                SizedBox(height: 10),
                DateTimeField(
                    format: _dateFormat,
                    decoration: InputDecoration(
                        labelText: "Data Fim",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                    initialValue: DateTime.now(),
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
}
