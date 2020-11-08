import 'dart:convert';

class Estados {
  int id;
  String sigla;
  String nome;
  Estados({
    this.id,
    this.sigla,
    this.nome,
  });

  factory Estados.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Estados(
      id: map['id'],
      sigla: map['sigla'],
      nome: map['nome'],
    );
  }

  factory Estados.fromJson(String source) =>
      Estados.fromMap(json.decode(source));

  static List<Estados> fromJsonList(List list) {
    if (list == null) return null;
    print(list.length);
    return list.map((item) => Estados.fromJson(item)).toList();
  }

  ///custom comparing function to check if two users are equal
  bool isEqual(Estados model) {
    return this?.id == model?.id;
  }

  @override
  String toString() => nome;
}
