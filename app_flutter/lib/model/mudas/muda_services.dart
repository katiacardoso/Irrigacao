import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'muda.dart';

class PlantasServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//método para persistir dados no firebase
  addPlantas(Muda muda) {
    _firestore.collection('Cadastro_muda').add(
          muda.toMap(),
        );
  }

  Future<String> loadPlantas(String idCadastroPlantas) async {
    var collection = _firestore.collection('lote');
    var docSnapshot = await collection.doc(idCadastroPlantas).get();
    Map<String, dynamic>? data = docSnapshot.data();
    // return '${data!['area']}';
    return Future.value(data!['area']);
  }

  ///método para obtenção de lista das muda
  Stream<QuerySnapshot> getPlantasList() {
    CollectionReference mudaRef = _firestore.collection('muda');
    return mudaRef.snapshots();
  }

//método para atualizar dados no firebase
  updateMuda(
    String idMuda,
    String nomeComum,
    String nomeCientifico,
    int quantidade,
    String data,
    String nomeDeterminador,
  ) {
    DocumentReference documentReference =
        _firestore.collection('Cadastro_muda').doc(idMuda);
    Map<String, dynamic> dado = <String, dynamic>{
      'idPlanta': idMuda,
      'nomeComum': nomeComum,
      'nomeCientifico': nomeCientifico,
      'quantidade': quantidade,
      'data': data,
      'nomeDeterminador': nomeDeterminador,
    };
    documentReference
        .update(dado)
        .whenComplete(
          () => debugPrint("Dados do $idMuda atualizado com sucesso!!!"),
        )
        .catchError(
          (e) => debugPrint("Erro ao atualizar dados do $idMuda -> $e!"),
        );
    ;
  }

//método para deletar dados no firebase
  deletePlantas(String idMuda) {
    DocumentReference documentReference =
        _firestore.collection('lote').doc(idMuda);
    documentReference
        .delete()
        .whenComplete(
          () => debugPrint("Dados do $idMuda com sucesso!!!"),
        )
        .catchError(
          (e) => debugPrint("Erro ao deletar dados do $idMuda -> $e!"),
        );
  }
}
