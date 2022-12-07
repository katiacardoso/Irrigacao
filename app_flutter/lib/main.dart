import 'package:app_flutter/cadastro_mudas.dart';
import 'package:app_flutter/login/login_screen.dart';
import 'package:app_flutter/model/doacao/cadastro_doacao.dart';
//import 'package:bnb_flutter/login/login_screen.dart';
//import 'package:bnb_flutter/login/signup_screen.dart';
//import 'package:bnb_flutter/units/unit_screen.dart';
//import 'package:bnb_flutter/utils/first_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'screen/home_screen.dart';
//import 'units/unit_screen.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //vinculação da aplicação com o firebase
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyCAfFtbWKBivwantM7EG1TIo4JjtuTSqdM",
    appId: "AIzaSyCAfFtbWKBivwantM7EG1TIo4JjtuTSqdM",
    messagingSenderId: "602721387882",
    projectId: "irrigacao-7f9a1",
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/home', //primeira página a ser chamada
      routes: {
        //'/home': (context) => LoginScreen()
        '/home': (context) => CadastrarDoacao(),
        //'/home': (context) => const HomeScreen(),
        //'/unit': (context) => UnitScreen(),
        //'/login': (context) => LoginScreen(),
        //'/signUp':(context) => SignUpScreen(),
      },
    );
  }
}
