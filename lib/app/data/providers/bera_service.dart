import 'package:bora_bebe/app/data/models/bera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BeraService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  getBeras(String municicpio) {
    return _firestore
        .collection("beras")
        .where("municicpio", isEqualTo: municicpio)
        .orderBy(
          "dataBera",
        )
        .snapshots();
  }
}
