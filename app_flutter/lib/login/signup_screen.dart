import 'package:flutter/material.dart';
import '../model/user/user_local.dart';
import '../model/user/user_services.dart';
import 'validators.dart';

class SignUpScreen extends StatelessWidget {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final UserLocal userLocal = UserLocal();

  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Criar conta de usuário'),
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
                  decoration: const InputDecoration(hintText: 'Nome completo'),
                  validator: (name) {
                    if (name!.isEmpty) {
                      return 'Campo obrigatório';
                    } else if (name.trim().split(' ').length <= 1) {
                      return 'Preencha seu nome completo';
                    }
                    return null;
                  },
                  onSaved: (name) => userLocal.name = name,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (email) {
                    if (email!.isEmpty) {
                      return 'Campo obrigatório';
                    } else if (emailValidator(email)) {
                      return 'Email inválido';
                    }
                    return null;
                  },
                  onSaved: (email) => userLocal.email = email,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Senha'),
                  obscureText: true,
                  validator: (password) {
                    if (password!.isEmpty) {
                      return 'Campo obrigatório';
                    } else if (password.length < 6) {
                      return 'Senha deve ter ao menos 6 caracteres';
                    }
                    return null;
                  },
                  onSaved: (password) => userLocal.password = password,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Repita a senha'),
                  obscureText: true,
                  validator: (password) {
                    if (password!.isEmpty) {
                      return 'Campo obrigatório';
                    } else if (password.length < 4) {
                      return 'Senha deve ter ao menos 4 caracteres';
                    }
                    return null;
                  },
                  onSaved: (password) => userLocal.confirmPassword = password,
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
                    if (formkey.currentState!.validate()) {
                      formkey.currentState!.save();
                      if (userLocal.password != userLocal.confirmPassword) {
                        const ScaffoldMessenger(
                          child: SnackBar(
                            content: Text(
                              'Senhas não coincidem',
                              style: TextStyle(fontSize: 11),
                            ),
                            backgroundColor: Colors.green,
                          ),
                        );
                        return;
                      }
                      UserServices userServices = UserServices();
                      userServices.signUp(
                        userLocal,
                        onSucess: () {
                          Navigator.of(context).pop();
                        },
                        onFail: (e) {
                          ScaffoldMessenger(
                            child: SnackBar(
                              content: Text(
                                'Falha ao registrar usuário: $e',
                                style: const TextStyle(fontSize: 11),
                              ),
                              backgroundColor: Colors.green,
                            ),
                          );
                        },
                      );
                    }
                  },
                  child: const Text(
                    'Criar conta',
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
