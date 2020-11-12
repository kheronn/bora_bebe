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

  Stream<List<Promocao>> getPromocoes(String municicpio) {
    return _firestore
        .collection("promocoes")
        .where("municicpio", isEqualTo: municicpio)
        .orderBy(
          "dataBera",
        )
        .snapshots()
        .map((QuerySnapshot query) {
      List<Promocao> promocoes = List();
      query.docs.forEach((element) {
        promocoes.add(Promocao.fromDocumentSnapshot(element));
      });
      return promocoes;
    });
  }
}
