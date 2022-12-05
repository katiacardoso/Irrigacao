class Plantas {
  final String nomeComum;
  final String nomeCientifico;
  final int quantidade;
  final String data;
  final String nomeDeterminador;

  Plantas(
    this.nomeComum,
    this.nomeCientifico,
     this.quantidade,
    this.data,
    this. nomeDeterminador,
  );

  @override
  String toString() {
    return 'Plantas{nome: $nomeComum, nomeCientifico: $nomeCientifico, quantidade: $quantidade, data: $data, nomeDeterminador: $nomeDeterminador}';
  }  
}