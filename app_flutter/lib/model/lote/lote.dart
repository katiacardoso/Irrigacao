import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Lote {
  String? idLote;
  String? nomeLote;
  DateTime? dataMudas;
  DateTime? dataReplantio;
  String? responsavelPlantio;
  String? responsavelReplantio;

  Lote({
    this.idLote,
    this.nomeLote,
    this.dataMudas,
    this.dataReplantio,
    this.responsavelPlantio,
    this.responsavelReplantio,
  });

  //metodo para coverter algum objeto para uma estrutura de dados compativel
  //com a estrutura do firebase
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idLote': idLote,
      'nomeLote': nomeLote,
      'dataMudas': dataMudas,
      'dataReplantio': dataReplantio,
      'responsavelPlantio': responsavelPlantio,
      'responsavelReplantio': responsavelReplantio,
    };
  }

  //métod para converter forato Json para objeto
  factory Lote.fromMap(Map<String, dynamic> map) {
    return Lote(
        idLote: map['idLote'] as String,
        nomeLote: map['nomeLote'] as String,
        dataMudas: (map['dataMudas'] as Timestamp).toDate(),
        dataReplantio: (map['dataReplantio'] as Timestamp).toDate(),
        responsavelPlantio: map['responsavelPlantio'] as String,
        responsavelReplantio: map['responsavelReplantio'] as String);
  }

  String toJson() => json.encode(toMap());

  factory Lote.fromJson(String source) =>
      Lote.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CadastroLote(idCadastroLote: $idLote, nomeLote: $nomeLote, dataMudas: $dataMudas, dataReplantio: $dataReplantio, responsavelPlantio: $responsavelPlantio, responsavelReplantio: $responsavelReplantio)';
  }
}
