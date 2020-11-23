import 'package:bora_bebe/app/data/models/promocao.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PromocaoService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CollectionReference _collection;

  PromocaoService() {
    _collection = _firestore.collection('promocoes');
  }

  Future<DocumentReference> add(Promocao promocao) {
    return _collection.add(promocao.toMap());
  }

  Stream<List<Promocao>> getPromocoes(String municipio, {int limit = 5}) {
    return _firestore
        .collection("promocoes")
        .where("municipio", isEqualTo: municipio)
        .orderBy("dataPromocao", descending: true)
        .limit(limit)
        .snapshots()
        .map((snapShot) => snapShot.docs
            .map((document) => Promocao.fromDocumentSnapshot(document))
            .toList());

    // Outra forma
    //      .map((QuerySnapshot query) {
    //   List<Promocao> promocoes = List();
    //   query.docs.forEach((element) {
    //     promocoes.add(Promocao.fromDocumentSnapshot(element));
    //   });
    //   return promocoes;
    // });
  }
}
