class Lotes{

final int numeroLote;
final String nomeLote;
late final String dataMudas;
final String dataReplantio;
final String reponsavelPlantio;
final String reponsavelReplantio;

Lotes(
  this.numeroLote,
  this.nomeLote,
  this.dataMudas,
  this.dataReplantio,
  this.reponsavelPlantio,
  this.reponsavelReplantio
);

 @override
  String toString() {
    return 'Lotes{numero do lote: $numeroLote, nome lote: $nomeLote, data mudas: $dataMudas, data replantio: $dataReplantio, responsavel pelo plantio: $reponsavelPlantio, responsavel pelo replantio: $reponsavelReplantio}';
  }  


}