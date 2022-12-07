import 'package:app_flutter/model/user_plantas.dart';
import 'package:flutter/material.dart';

void main() => runApp(CadastrarMudas());

class CadastrarMudas extends StatelessWidget {
  // This widget is the root of your application.

  final TextEditingController _controladorNomeComum = TextEditingController();
  final TextEditingController _controladorNomeCientifico =
      TextEditingController();
  final TextEditingController _controladorQuantidade = TextEditingController();
  final TextEditingController _controladorData = TextEditingController();
  final TextEditingController _controladorNomeDeterminador =
      TextEditingController();

  CadastrarMudas({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cadastrando mudas'),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TextField(
                  controller: _controladorNomeComum,
                  decoration: const InputDecoration(labelText: 'Nome Comum:'),
                  keyboardType: TextInputType.text),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TextField(
                  controller: _controladorNomeCientifico,
                  decoration: const InputDecoration(labelText: 'Nome Cienfico:'),
                  keyboardType: TextInputType.text),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TextField(
                  controller: _controladorQuantidade,
                  decoration:
                      const InputDecoration(labelText: 'Quantidade de mudas:'),
                  keyboardType: TextInputType.number),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TextField(
                  controller: _controladorData,
                  decoration: const InputDecoration(labelText: 'Data da plantação:'),
                  keyboardType: TextInputType.datetime),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TextField(
                  controller: _controladorNomeDeterminador,
                  decoration: const InputDecoration(labelText: 'Nome Determinador:'),
                  keyboardType: TextInputType.text),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: ElevatedButton(
                child: const Text('Cadastrar'),
                onPressed: () {
                  final String nomeComum = _controladorNomeComum.text;
                  final String nomeCientifico = _controladorNomeCientifico.text;
                  final int quantidade = int.parse(_controladorQuantidade.text);
                  final String data = _controladorData.text;
                  final String nomeDeterminador =
                      _controladorNomeDeterminador.text;

                  final Plantas mudaNova = Plantas(nomeComum, nomeCientifico,
                      quantidade, data, nomeDeterminador);
                  print(mudaNova);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
