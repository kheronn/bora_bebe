import 'dart:convert';

class Promocao {
  String marca;
  String descricao;
  double preco;
  String comentario;
  String municicpio;
  DateTime dataBera;
  DateTime dataExpira;
  String lugar;
  double latitude;
  double longitude;
  Promocao({
    this.marca,
    this.descricao,
    this.preco,
    this.comentario,
    this.municicpio,
    this.dataBera,
    this.dataExpira,
    this.lugar,
    this.latitude,
    this.longitude,
  });

  Map<String, dynamic> toMap() {
    return {
      'marca': marca,
      'descricao': descricao,
      'preco': preco,
      'comentario': comentario,
      'municicpio': municicpio,
      'dataBera': dataBera?.millisecondsSinceEpoch,
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
      comentario: map['comentario'],
      municicpio: map['municicpio'],
      dataBera: DateTime.fromMillisecondsSinceEpoch(map['dataBera']),
      dataExpira: DateTime.fromMillisecondsSinceEpoch(map['dataExpira']),
      lugar: map['lugar'],
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Promocao.fromJson(String source) =>
      Promocao.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Bera(marca: $marca, descricao: $descricao, preco: $preco, comentario: $comentario, dataBera: $dataBera, dataExpira: $dataExpira, lugar: $lugar, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Promocao &&
        o.marca == marca &&
        o.descricao == descricao &&
        o.preco == preco &&
        o.comentario == comentario &&
        o.dataBera == dataBera &&
        o.dataExpira == dataExpira &&
        o.lugar == lugar &&
        o.latitude == latitude &&
        o.longitude == longitude;
  }

  @override
  int get hashCode {
    return marca.hashCode ^
        descricao.hashCode ^
        preco.hashCode ^
        comentario.hashCode ^
        dataBera.hashCode ^
        dataExpira.hashCode ^
        lugar.hashCode ^
        latitude.hashCode ^
        longitude.hashCode;
  }
}
