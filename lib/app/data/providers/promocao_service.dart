import 'package:bora_bebe/app/data/models/promocao.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PromocaoService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  getBeras(String municicpio) {
    return _firestore
        .collection("promocoes")
        .where("municicpio", isEqualTo: municicpio)
        .orderBy(
          "dataBera",
        )
        .snapshots();
  }
}
