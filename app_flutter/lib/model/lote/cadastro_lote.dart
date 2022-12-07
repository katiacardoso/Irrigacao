import 'package:app_flutter/model/lote/lote_services.dart';
import 'package:flutter/material.dart';

import 'lote.dart';

void main() => runApp(CadastrarLote());

class CadastrarLote extends StatelessWidget {
  // This widget is the root of your application.

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  Lote loteLocal = Lote();

  CadastrarLote({super.key});

  @override
  Widget build(BuildContext context) {
    //final CollectionReference lote = FirebaseFirestore.instance.collection('Cadastro_lote');

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Cadastrar lote'),
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
                  decoration: const InputDecoration(hintText: 'Nome do lote'),
                  validator: (nomeLote) {
                    if (nomeLote!.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                  onSaved: (nomeLote) => loteLocal.nomeLote = nomeLote,
                ),
                const SizedBox(
                  height: 16,
                ),
                InputDatePickerFormField(
                  fieldHintText: "Preencha no formato dd/mm/aaaa",
                  firstDate: DateTime(2010),
                  lastDate: DateTime(2100),
                  initialDate: loteLocal.dataMudas,
                  onDateSubmitted: (date) {
                    loteLocal.dataMudas = date;
                  },
                  onDateSaved: (dataMudas) => loteLocal.dataMudas = dataMudas,
                ),
                const SizedBox(
                  height: 16,
                ),
                InputDatePickerFormField(
                  fieldHintText: "Preencha no formato dd/mm/aaaa",
                  firstDate: DateTime(2010),
                  lastDate: DateTime(2100),
                  initialDate: loteLocal.dataReplantio,
                  onDateSubmitted: (date) {
                    loteLocal.dataReplantio = date;
                  },
                  onDateSaved: (dataReplantio) =>
                      loteLocal.dataReplantio = dataReplantio,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Nome do responsável pelo plantio'),
                  validator: (responsavelPlantio) {
                    if (responsavelPlantio!.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                  onSaved: (responsavelPlantio) =>
                      loteLocal.responsavelPlantio = responsavelPlantio,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Nome do responsável pelo replantio'),
                  validator: (responsavelReplantio) {
                    if (responsavelReplantio!.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                  onSaved: (responsavelReplantio) =>
                      loteLocal.responsavelReplantio = responsavelReplantio,
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

                    LoteServices loteServices = LoteServices();
                    loteServices.addLotes(loteLocal);
/*
                    lote
                        .add({
                          'idLote': loteLocal.idLote,
                          'nomeLote': loteLocal.nomeLote,
                          'dataMudas': loteLocal.dataMudas,
                          'dataReplantio': loteLocal.dataReplantio,
                          'responsavelPlantio': loteLocal.responsavelPlantio,
                          'responsavelReplantio':
                              loteLocal.responsavelReplantio,
                        })
                        .then((value) => print("Lote Added"))
                        .catchError(
                            (error) => print("Failed to add lote: $error"));*/
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
