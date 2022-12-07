import 'package:app_flutter/model/doacao/cadastro_doacao.dart';
import 'package:app_flutter/model/mudas/cadastro_muda.dart';
import 'package:flutter/material.dart';

import '../model/lote/cadastro_lote.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  //final List<String> _list = ['Administração', 'Financeiro', 'Recicláveis'];
  final List<String> _list = ['Mudas', 'Lotes', 'Doações'];

  //final List<String> _list = ['Administração'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _list.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Cadastro",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white)),
          centerTitle: true,
          bottom: TabBar(
            isScrollable: false,
            tabs: _list.map((String ss) {
              return Tab(text: ss);
            }).toList(),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            CadastrarMudas(),
            CadastrarLote(),
            //FinancialManagementPage('Gerência Financeira'),
            CadastrarDoacao(),
          ],
        ),
      ),
    );
  }
}
