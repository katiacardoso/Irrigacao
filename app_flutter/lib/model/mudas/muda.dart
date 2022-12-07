class Muda {
  String? idMuda;
  String? nomeComum;
  String? nomeCientifico;
  String? quantidade;
  DateTime? data;
  String? nomeDeterminador;

  Muda({
    this.idMuda,
    this.nomeComum,
    this.nomeCientifico,
    this.quantidade,
    this.data,
    this.nomeDeterminador,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idPlanta': idMuda,
      'nomeComum': nomeComum,
      'nomeCientifico': nomeCientifico,
      'quantidade': quantidade,
      'data': data,
      'nomeDeterminador': nomeDeterminador,
    };
  }

  //métod para converter forato Json para objeto
  factory Muda.fromMap(Map<String, dynamic> map) {
    return Muda(
        idMuda: map['idMuda'],
        nomeComum: map['nomeComum'],
        nomeCientifico: map['nomeCientifico'],
        quantidade: map['quantidade'],
        data: map['data'],
        nomeDeterminador: map['nomeDeterminador']);
  }
}
