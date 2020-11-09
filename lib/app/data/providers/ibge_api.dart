import 'dart:convert';

import 'package:bora_bebe/app/data/models/municipio.dart';
import 'package:bora_bebe/app/data/models/uf.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class IbgeAPI {
  static const String url =
      "https://servicodados.ibge.gov.br/api/v1/localidades/estados";

  Future<List<Uf>> getUfs() async {
    return Dio().get(url).then(
          (res) => res?.data
              ?.map<Uf>(
                (u) => Uf.fromMap(u),
              )
              ?.toList(),
        );
  }

  Future<List<Municipio>> getMunicipios(String id) async {
    return Dio().get("$url/$id/municipios").then(
          (res) => res?.data
              ?.map<Municipio>(
                (u) => Municipio.fromMap(u),
              )
              ?.toList(),
        );
  }
}
