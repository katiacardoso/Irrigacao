import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'doacao.dart';

class DoacaoServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//método para persistir dados no firebase
  addDoacao(Doacao doacao) {
    _firestore.collection('doacao').add(
          doacao.toMap(),
        );
  }

  Future<String> loadDoacao(String idCadastroDoacao) async {
    var collection = _firestore.collection('lote');
    var docSnapshot = await collection.doc(idCadastroDoacao).get();
    Map<String, dynamic>? data = docSnapshot.data();
    // return '${data!['area']}';
    return Future.value(data!['area']);
  }

  ///método para obtenção de lista das mudas
  Stream<QuerySnapshot> getDoacaoList() {
    CollectionReference doacaoRef = _firestore.collection('doacao');
    return doacaoRef.snapshots();
  }

//método para atualizar dados no firebase
  updateDoacao(
    String idCadastroDoacao,
    String numeroLote,
    String localDoacao,
    DateTime dataDoacao,
    String nomePessoa,
  ) {
    DocumentReference documentReference =
        _firestore.collection('doacao').doc(idCadastroDoacao);
    Map<String, dynamic> data = <String, dynamic>{
      'idCadastroDoacao': idCadastroDoacao,
      'numeroLote': numeroLote,
      'localDoacao': localDoacao,
      'dataDoacao': dataDoacao,
      'nomePessoa': nomePessoa,
    };
    documentReference
        .update(data)
        .whenComplete(
          () => debugPrint(
              "Dados do $idCadastroDoacao atualizado com sucesso!!!"),
        )
        .catchError(
          (e) =>
              debugPrint("Erro ao atualizar dados do $idCadastroDoacao -> $e!"),
        );
    ;
  }

//método para deletar dados no firebase
  deleteDoacao(String idCadastroDoacao) {
    DocumentReference documentReference =
        _firestore.collection('lote').doc(idCadastroDoacao);
    documentReference
        .delete()
        .whenComplete(
          () => debugPrint("Dados do $idCadastroDoacao com sucesso!!!"),
        )
        .catchError(
          (e) =>
              debugPrint("Erro ao deletar dados do $idCadastroDoacao -> $e!"),
        );
  }
}
