import 'package:bora_bebe/app/data/models/cerveja.dart';
import 'package:bora_bebe/app/data/models/municipio.dart';
import 'package:bora_bebe/app/data/models/uf.dart';
import 'package:dio/dio.dart';

class APIs {
  static const String urlIBGE =
      "https://servicodados.ibge.gov.br/api/v1/localidades/estados";

  static const String urlCervejas =
      "https://script.google.com/macros/s/AKfycbyB0MzRsflZ8DsSwy7ZRqCvrQOdzYcYQIhFfY0h-kuVyA7B2VeI/exec";

  Future<List<Uf>> getUfs() async {
    return Dio().get(urlIBGE).then(
          (res) => res?.data
              ?.map<Uf>(
                (u) => Uf.fromMap(u),
              )
              ?.toList(),
        );
  }

  Future<List<Municipio>> getMunicipios(String id) async {
    return Dio().get("$urlIBGE/$id/municipios").then(
          (res) => res?.data
              ?.map<Municipio>(
                (u) => Municipio.fromMap(u),
              )
              ?.toList(),
        );
  }

  Future<List<Cerveja>> getAllCervejas() async {
    return Dio().get(urlCervejas).then(
          (res) => res?.data['cervejas']
              ?.map<Cerveja>(
                (u) => Cerveja.fromMap(u),
              )
              ?.toList(),
        );
  }
}
