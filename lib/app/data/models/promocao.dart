import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Promocao {
  String id;
  String marca;
  String marcaImagem;
  String descricao;
  double preco;
  String volume;
  String comentario;
  String municipio;
  DateTime dataPromocao;
  DateTime dataExpira;
  String lugar;
  String endereco;
  double latitude;
  double longitude;
  Promocao({
    this.id,
    this.marca,
    this.marcaImagem,
    this.descricao,
    this.preco,
    this.volume,
    this.comentario,
    this.municipio,
    this.dataPromocao,
    this.dataExpira,
    this.lugar,
    this.endereco,
    this.latitude,
    this.longitude,
  });

  Promocao.fromDocumentSnapshot(
    DocumentSnapshot doc,
  ) {
    this.id = doc.id;
    this.marca = doc.data()["marca"];
    this.marcaImagem = doc.data()["marcaImagem"];
    this.descricao = doc.data()["descricao"] ?? '';
    this.preco = doc.data()["preco"];
    this.volume = doc.data()["volume"];
    this.comentario = doc.data()["comentario"] ?? '';
    this.municipio = doc.data()["municipio"];
    this.dataPromocao =
        DateTime.fromMillisecondsSinceEpoch(doc.data()["dataPromocao"]);
    this.dataExpira = doc.data()["dataExpira"] != null
        ? DateTime.fromMillisecondsSinceEpoch(doc.data()["dataExpira"])
        : null;

    this.lugar = doc.data()["lugar"];
    this.endereco = doc.data()["endereco"];
    this.latitude = doc.data()["latitude"];
    this.longitude = doc.data()["longitude"];
  }

  Map<String, dynamic> toMap() {
    return {
      'marca': marca,
      'marcaImagem': marcaImagem,
      'descricao': descricao,
      'preco': preco,
      'volume': volume,
      'comentario': comentario,
      'municipio': municipio,
      'dataPromocao': dataPromocao?.millisecondsSinceEpoch,
      'dataExpira': dataExpira?.millisecondsSinceEpoch,
      'lugar': lugar,
      'endereco': endereco,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory Promocao.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Promocao(
      marca: map['marca'],
      marcaImagem: map['marcaImagem'],
      descricao: map['descricao'],
      preco: map['preco'],
      volume: map['volume'],
      comentario: map['comentario'],
      municipio: map['municipio'],
      dataPromocao: DateTime.fromMillisecondsSinceEpoch(map['dataPromocao']),
      dataExpira: DateTime.fromMillisecondsSinceEpoch(map['dataExpira']),
      lugar: map['lugar'],
      endereco: map['endereco'],
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Promocao.fromJson(String source) =>
      Promocao.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Promocao(marca: $marca, descricao: $descricao, preco: $preco, volume: $volume, comentario: $comentario, municicpio: $municipio, dataPromocao: $dataPromocao, dataExpira: $dataExpira, lugar: $lugar, latitude: $latitude, longitude: $longitude)';
  }
}
