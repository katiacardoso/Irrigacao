import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'lote.dart';

class LoteServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//método para persistir dados no firebase
  addLotes(Lote lote) {
    _firestore.collection('Cadastro_lotes').add(
          lote.toMap(),
        );
  }

  Future<String> loadLote(String idLote) async {
    var collection = _firestore.collection('Cadastro_lote');
    var docSnapshot = await collection.doc(idLote).get();
    Map<String, dynamic>? data = docSnapshot.data();
    // return '${data!['area']}';
    return Future.value(data!['area']);
  }

  ///método para obtenção de lista das mudas
  Stream<QuerySnapshot> getLoteList() {
    CollectionReference loteRef = _firestore.collection('Cadastro_lote');
    return loteRef.snapshots();
  }

//método para atualizar dados no firebase
  updateLote(
    String idLote,
    String nomeLote,
    DateTime dataMudas,
    DateTime dataReplantio,
    String responsavelPlantio,
    String responsavelReplantio,
  ) {
    DocumentReference documentReference =
        _firestore.collection('Cadastro_lote').doc(idLote);
    Map<String, dynamic> data = <String, dynamic>{
      'idCadastroLote': idLote,
      'nomeLote': nomeLote,
      'dataMudas': dataMudas,
      'dataReplantio': dataReplantio,
      'responsavelPlantio': responsavelPlantio,
       'responsavelReplantio': responsavelReplantio,
    };
    documentReference
        .update(data)
        .whenComplete(
          () => debugPrint("Dados do $idLote atualizado com sucesso!!!"),
        )
        .catchError(
          (e) => debugPrint("Erro ao atualizar dados do $idLote -> $e!"),
        );
    ;
  }

//método para deletar dados no firebase
  deleteLote(String idLote) {
    DocumentReference documentReference =
        _firestore.collection('Cadastro_lote').doc(idLote);
    documentReference
        .delete()
        .whenComplete(
          () => debugPrint("Dados do $idLote com sucesso!!!"),
        )
        .catchError(
          (e) => debugPrint("Erro ao deletar dados do $idLote -> $e!"),
        );
  }
}