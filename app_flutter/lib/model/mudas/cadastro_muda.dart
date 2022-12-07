import 'package:app_flutter/model/mudas/muda.dart';
import 'package:app_flutter/model/mudas/muda_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() => runApp(CadastrarMudas());

class CadastrarMudas extends StatelessWidget {
  // This widget is the root of your application.

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  Muda mudaLocal = Muda();

  CadastrarMudas({super.key});

  @override
  Widget build(BuildContext context) {
    mudaLocal.data = DateTime.now();

    final CollectionReference muda =
        FirebaseFirestore.instance.collection('Cadastro_muda');

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Cadastrar muda'),
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
                  decoration: const InputDecoration(hintText: 'Nome comum'),
                  validator: (nomeComum) {
                    if (nomeComum!.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                  onSaved: (nomeComum) => mudaLocal.nomeComum = nomeComum,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(hintText: 'Nome científico'),
                  validator: (nomeCientifico) {
                    if (nomeCientifico!.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                  onSaved: (nomeCientifico) =>
                      mudaLocal.nomeCientifico = nomeCientifico,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Quantidade'),
                  validator: (quantidade) {
                    if (quantidade!.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                  onSaved: (quantidade) => mudaLocal.quantidade = quantidade,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(hintText: 'Nome determinador'),
                  validator: (nomeDeterminador) {
                    if (nomeDeterminador!.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                  onSaved: (nomeDeterminador) =>
                      mudaLocal.nomeDeterminador = nomeDeterminador,
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

                    PlantasServices plantaServices = PlantasServices();
                    plantaServices.addPlantas(mudaLocal);

                    muda
                        .add({
                          'idPlanta': mudaLocal.idMuda,
                          'nomeComum': mudaLocal.nomeComum,
                          'nomeCientifico': mudaLocal.nomeCientifico,
                          'data': mudaLocal.data,
                          'quantidade': mudaLocal.quantidade,
                          'nomeDeterminador': mudaLocal.nomeDeterminador
                        })
                        .then((value) => print("Muda Added"))
                        .catchError(
                            (error) => print("Failed to add muda: $error"));
                  },
                  child: const Text(
                    'Cadastrar muda',
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
