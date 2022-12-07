class Plantas {
  String? idPlanta;
  String? nomeComum;
  String? nomeCientifico;
  int? quantidade;
  DateTime? data;
  String? nomeDeterminador;

  Plantas({
    this.idPlanta,
    this.nomeComum,
    this.nomeCientifico,
    this.quantidade,
    this.data,
    this.nomeDeterminador,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idPlanta': idPlanta,
      'nomeComum': nomeComum,
      'nomeCientifico': nomeCientifico,
      'quantidade': quantidade,
      'data': data,
      'nomeDeterminador': nomeDeterminador,
    };
  }

  //métod para converter forato Json para objeto
  factory Plantas.fromMap(Map<String, dynamic> map) {
    return Plantas(
        idPlanta: map['idPlanta'],
        nomeComum: map['nomeComum'],
        nomeCientifico: map['nomeCientifico'],
        quantidade: map['quantidade'],
        data: map['data'],
        nomeDeterminador: map['nomeDeterminador']);
  }
}
