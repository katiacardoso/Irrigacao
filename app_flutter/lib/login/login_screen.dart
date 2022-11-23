import 'package:app_flutter/main.dart';
//import 'package:bnb_flutter/dashboard/items_dashboard.dart';
//import 'package:bnb_flutter/screen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:bnb_flutter/models/unit_service.dart';
import 'dart:html';

import '../cadastro_mudas.dart';
import '../model/user/user_local.dart';
import '../model/user/user_services.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  UserLocal userLocal = UserLocal();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          const Image(
            width: 280,
            height: 280,
            image: AssetImage('assets/ifmt.png'),
          ),
          const Text(
            'PLANTINHA',
            style: TextStyle(
              color: Colors.redAccent,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 180,
              right: 180,
              top: 30,
              bottom: 30,
            ),
            child: Card(
              elevation: 1.0,
              color: Colors.grey.shade200,
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          TextFormField(
                            //o value apos == está dando erro, mas talvez seja por conta da falta da tela anterior
                            onSaved: (value) => userLocal.email = value,
                            initialValue: userLocal.email,
                            decoration:
                                const InputDecoration(hintText: 'Email...'),
                            validator: (value) {
                              if (value == null) {
                                return 'Por favor, insira o email';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            onSaved: (value) => userLocal.password = value,
                            initialValue: userLocal.password,
                            decoration:
                                const InputDecoration(hintText: 'Senha...'),
                            validator: (value) {
                              if (value == null) {
                                return 'Por favor, insira a senha';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OutlinedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                UserServices _userServices = UserServices();
                                _userServices.signIn(userLocal, onSucess: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CadastrarMudas()));
                                }, onFail: (e) {
                                  const Text('e');
                                });
                              }
                            },
                            child: const Text('Entrar')),
                        OutlinedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => SignUpScreen(),
                                ),
                              );
                            },
                            child: const Text('Registrar-se')),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
