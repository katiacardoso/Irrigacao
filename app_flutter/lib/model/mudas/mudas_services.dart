import 'package:app_flutter/model/mudas/user_plantas.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class PlantasServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//método para persistir dados no firebase
  addPlantas(Plantas plantas) {
    _firestore.collection('plantas').add(
          plantas.toMap(),
        );
  }

  Future<String> loadPlantas(String idCadastroPlantas) async {
    var collection = _firestore.collection('lote');
    var docSnapshot = await collection.doc(idCadastroPlantas).get();
    Map<String, dynamic>? data = docSnapshot.data();
    // return '${data!['area']}';
    return Future.value(data!['area']);
  }

  ///método para obtenção de lista das mudas
  Stream<QuerySnapshot> getPlantasList() {
    CollectionReference plantasRef = _firestore.collection('plantas');
    return plantasRef.snapshots();
  }

//método para atualizar dados no firebase
  updatePlantas(
    String idPlanta,
    String nomeComum,
    String nomeCientifico,
    int quantidade,
    String data,
    String nomeDeterminador,
  ) {
    DocumentReference documentReference =
        _firestore.collection('plantas').doc(idPlanta);
    Map<String, dynamic> dado = <String, dynamic>{
      'idPlanta': idPlanta,
      'nomeComum': nomeComum,
      'nomeCientifico': nomeCientifico,
      'quantidade': quantidade,
      'data': data,
      'nomeDeterminador': nomeDeterminador,
    };
    documentReference
        .update(dado)
        .whenComplete(
          () => debugPrint(
              "Dados do $idPlanta atualizado com sucesso!!!"),
        )
        .catchError(
          (e) => debugPrint(
              "Erro ao atualizar dados do $idPlanta -> $e!"),
        );
    ;
  }

//método para deletar dados no firebase
  deletePlantas(String idPlanta) {
    DocumentReference documentReference =
        _firestore.collection('lote').doc(idPlanta);
    documentReference
        .delete()
        .whenComplete(
          () => debugPrint("Dados do $idPlanta com sucesso!!!"),
        )
        .catchError(
          (e) =>
              debugPrint("Erro ao deletar dados do $idPlanta -> $e!"),
        );
  }
}
