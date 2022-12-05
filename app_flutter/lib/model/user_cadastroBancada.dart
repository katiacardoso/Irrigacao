class Bancada{

final int id;
final String responsavelPeloCadastro;
final String numeroTotalLote;
final String numeroLote;


Bancada(
  this.id,
  this.responsavelPeloCadastro,
  this.numeroTotalLote,
  this.numeroLote
); 

 @override
  String toString() {
    return 'Lotes{Responsavel pelo cadastro: $responsavelPeloCadastro, Numero total de lote: $numeroTotalLote, Numero do lote: $numeroLote}';
  }  


}