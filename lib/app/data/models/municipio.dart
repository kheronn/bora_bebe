import 'dart:convert';

class Municipio {
  int id;
  String nome;
  Municipio({
    this.id,
    this.nome,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
    };
  }

  factory Municipio.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Municipio(
      id: map['id'],
      nome: map['nome'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Municipio.fromJson(String source) =>
      Municipio.fromMap(json.decode(source));

  bool isEqual(Municipio model) {
    return this?.id == model?.id;
  }

  @override
  String toString() => nome;
}
