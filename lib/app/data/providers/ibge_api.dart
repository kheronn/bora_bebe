import 'dart:convert';

import 'package:bora_bebe/app/data/models/municipio.dart';
import 'package:bora_bebe/app/data/models/uf.dart';
import 'package:http/http.dart' as http;

class IbgeAPI {
  static const String url =
      "https://servicodados.ibge.gov.br/api/v1/localidades/estados";

  Future<List<Uf>> getUfs() async {
    List<Uf> list = List();
    var response = await http.get(url);
    if (response.statusCode == 200) {
      list = (json.decode(response.body) as List)
          .map((data) => new Uf.fromJson(data))
          .toList();
      return list;
    }
    return null;
  }

  Future<List<Municipio>> getMunicipios(String ufId) async {
    List<Municipio> list = List();
    var response = await http.get("$url/$ufId/municipios");
    if (response.statusCode == 200) {
      list = (json.decode(response.body) as List)
          .map((data) => new Municipio.fromJson(data))
          .toList();
      return list;
    }
    return null;
  }
}
