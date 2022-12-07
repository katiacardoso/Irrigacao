//tratamento dos dados
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'user_local.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
FirebaseFirestore _firestore = FirebaseFirestore.instance;

class UserServices {
  UserLocal? userLocal;

  //metodo para realizar a autenticacao no firebase com email e senha
  Future<void> signIn(
    UserLocal userLocal, {
    Function? onSucess,
    Function? onFail,
  }) async {
    try {
      User? user = (await _auth.signInWithEmailAndPassword(
              email: userLocal.email!, password: userLocal.password!))
          .user;
      this.userLocal = userLocal;
      this.userLocal!.id = user!.uid;
      onSucess!();
    } on PlatformException catch (e) {
      onFail!(debugPrint(e.toString()));
    }
  }

  //metodo para registrar o usuario no firebase
  Future signUp(UserLocal userLocal,
      {Function? onSucess, Function? onFail}) async {
    try {
      User? user = (await _auth.createUserWithEmailAndPassword(
              email: userLocal.email!, password: userLocal.password!))
          .user;
      this.userLocal = userLocal;
      this.userLocal?.id = user!.uid;
      onSucess!();
    } catch (e) {
      onFail!(e);
    }
  }
}
