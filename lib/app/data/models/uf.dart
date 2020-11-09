import 'dart:convert';

class Uf {
  int id;
  String sigla;
  String nome;

  Uf({
    this.id,
    this.sigla,
    this.nome,
  });

  factory Uf.fromMap(Map<dynamic, dynamic> map) {
    if (map == null) return null;

    return Uf(
      id: map['id'],
      sigla: map['sigla'],
      nome: map['nome'],
    );
  }

  factory Uf.fromJson(String source) => Uf.fromMap(json.decode(source));

  ///custom comparing function to check if two ufs are equal
  bool isEqual(Uf model) {
    return this?.id == model?.id;
  }

  @override
  String toString() => nome;
}
