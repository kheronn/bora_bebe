import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Promocao {
  String marca;
  String descricao;
  double preco;
  String volume;
  String comentario;
  String municicpio;
  DateTime dataPromocao;
  DateTime dataExpira;
  String lugar;
  double latitude;
  double longitude;
  Promocao({
    this.marca,
    this.descricao,
    this.preco,
    this.volume,
    this.comentario,
    this.municicpio,
    this.dataPromocao,
    this.dataExpira,
    this.lugar,
    this.latitude,
    this.longitude,
  });

  Promocao.fromDocumentSnapshot(
    DocumentSnapshot doc,
  ) {
    //id = documentSnapshot.documentID;
    this.marca = doc.data()["marca"];
    this.descricao = doc.data()["descricao"] ?? '';
    this.preco = doc.data()["preco"];
    this.volume = doc.data()["volume"];
    this.comentario = doc.data()["comentario"] ?? '';
    this.municicpio = doc.data()["municipio"];
    Timestamp timestampDataPonto = doc.data()["dataPromocao"];
    this.dataPromocao = DateTime.fromMillisecondsSinceEpoch(
        timestampDataPonto.millisecondsSinceEpoch);
    Timestamp timestampDataExpira = doc.data()["dataPromocao"];
    this.dataExpira = DateTime.fromMillisecondsSinceEpoch(
        timestampDataExpira.millisecondsSinceEpoch);

    this.lugar = doc.data()["lugar"];
    this.latitude = doc.data()["latitude"];
    this.longitude = doc.data()["longitude"];
  }

  Map<String, dynamic> toMap() {
    return {
      'marca': marca,
      'descricao': descricao,
      'preco': preco,
      'volume': volume,
      'comentario': comentario,
      'municicpio': municicpio,
      'dataBera': dataPromocao?.millisecondsSinceEpoch,
      'dataExpira': dataExpira?.millisecondsSinceEpoch,
      'lugar': lugar,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory Promocao.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Promocao(
      marca: map['marca'],
      descricao: map['descricao'],
      preco: map['preco'],
      volume: map['volume'],
      comentario: map['comentario'],
      municicpio: map['municicpio'],
      dataPromocao: DateTime.fromMillisecondsSinceEpoch(map['dataBera']),
      dataExpira: DateTime.fromMillisecondsSinceEpoch(map['dataExpira']),
      lugar: map['lugar'],
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Promocao.fromJson(String source) =>
      Promocao.fromMap(json.decode(source));
}
