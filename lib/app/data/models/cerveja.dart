import 'dart:convert';

class Cerveja {
  String marca;
  String tipo;
  String imagem;
  Cerveja({
    this.marca,
    this.tipo,
    this.imagem,
  });

  Map<String, dynamic> toMap() {
    return {
      'marca': marca,
      'tipo': tipo,
      'imagem': imagem,
    };
  }

  factory Cerveja.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Cerveja(
      marca: map['marca'],
      tipo: map['tipo'],
      imagem: map['imagem'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Cerveja.fromJson(String source) =>
      Cerveja.fromMap(json.decode(source));

  bool isEqual(Cerveja model) {
    return this?.marca == model?.marca;
  }

  @override
  String toString() => marca.toUpperCase();
}
