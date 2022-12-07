import 'package:app_flutter/model/doacao/doacao_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'doacao.dart';

void main() => runApp(CadastrarDoacao());

class CadastrarDoacao extends StatelessWidget {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  // This widget is the root of your application.
  final TextEditingController _controladorNumeroLote = TextEditingController();
  final TextEditingController _controladorLocalDoacao = TextEditingController();
  final TextEditingController _controladorDataDoacao = TextEditingController();
  final TextEditingController _controladorNomeDeterminador =
      TextEditingController();

  final Doacao doacaoLocal = Doacao();

  CadastrarDoacao({super.key});

  @override
  Widget build(BuildContext context) {
    doacaoLocal.dataDoacao = DateTime.now();

    final CollectionReference doacao =
        FirebaseFirestore.instance.collection('Cadastro_doacao');

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Cadastrar doacão'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formkey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              shrinkWrap: true,
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Numero do lote'),
                  validator: (numeroLote) {
                    if (numeroLote!.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                  onSaved: (numeroLote) => doacaoLocal.numeroLote = numeroLote,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(hintText: 'Local da doação'),
                  validator: (localDoacao) {
                    if (localDoacao!.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                  onSaved: (localDoacao) =>
                      doacaoLocal.localDoacao = localDoacao,
                ),
                const SizedBox(
                  height: 16,
                ),/*
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Data da doação'),
                  keyboardType: TextInputType.datetime,
                  validator: (dataDoacao) {
                    if (dataDoacao!.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                  onSaved: (dataDoacao) =>
                      doacaoLocal.dataDoacao = DateTime.now(),
                ),
                const SizedBox(
                  height: 16,
                ),*/
                TextFormField(
                  decoration:
                      const InputDecoration(hintText: 'Nome do determinador'),
                  validator: (nomeDeterminador) {
                    if (nomeDeterminador!.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                  onSaved: (nomeDeterminador) =>
                      doacaoLocal.nomeDeterminador = nomeDeterminador,
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                  ),
                  onPressed: () {
                    formkey.currentState!.save();

                    DoacaoServices doacaoServices = DoacaoServices();
                    doacaoServices.addDoacao(doacaoLocal);

                    doacao
                        .add({
                          'id': doacaoLocal.idDoacao,
                          'numeroLote': doacaoLocal.numeroLote,
                          'localDoacao': doacaoLocal.localDoacao,
                          'dataDoacao': doacaoLocal.dataDoacao,
                          'nomeDeterminador': doacaoLocal.nomeDeterminador
                        })
                        .then((value) => print("Doacao Added"))
                        .catchError(
                            (error) => print("Failed to add doacao: $error"));
                  },
                  child: const Text(
                    'Cadastrar doação',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
