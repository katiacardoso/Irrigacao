import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Doacao {
  String? idDoacao;
  String? numeroLote;
  String? localDoacao;
  DateTime? dataDoacao;
  String? nomeDeterminador;

  Doacao({
    this.idDoacao,
    this.numeroLote,
    this.localDoacao,
    this.dataDoacao,
    this.nomeDeterminador,
  });

  //metodo para coverter algum objeto para uma estrutura de dados compativel
  //com a estrutura do firebase
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idDoacao': idDoacao,
      'numeroLote': numeroLote,
      'localDoacao': localDoacao,
      'dataDoacao': dataDoacao,
      'nomeDeterminador': nomeDeterminador,
    };
  }

  //métod para converter forato Json para objeto
  factory Doacao.fromMap(Map<String, dynamic> map) {
    return Doacao(
        idDoacao: map['idDoacao'] as String,
        numeroLote: map['numeroLote'] as String,
        localDoacao: map['localDoacao'] as String,
        dataDoacao: (map['dataDoacao'] as Timestamp).toDate(),
        nomeDeterminador: map['nomeDeterminador'] as String);
  }

  String toJson() => json.encode(toMap());

  factory Doacao.fromJson(String source) =>
      Doacao.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Doacao(idDoacao: $idDoacao, numeroLote: $numeroLote, localDoacao: $localDoacao, dataDoacao: $dataDoacao, nomeDeterminador: $nomeDeterminador)';
  }
}
