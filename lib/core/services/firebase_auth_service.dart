import 'package:firbase_auth_v2/core/model/user_model.dart';
import 'package:firbase_auth_v2/core/services/auth_base.dart';
import 'package:firbase_auth_v2/core/services/convert_users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

String errorMessage = '';

class FirebaseAuthService with ConvertUser implements AuthBase {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  Future<UserModel?> createUserwithEmailandPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      errorMessage = '';
      return convertUser(userCredential.user);
    } on FirebaseAuthException catch (ex) {
      debugPrint(ex.code);
      switch (ex.code) {
        case 'invalid-email':
          errorMessage = 'Please insert valid email adress.';
          break;
        case 'email-already-in-use':
          errorMessage = 'Email is already used by another acount.';
          break;
        default:
      }
      return null;
    }
  }

  @override
  Stream<UserModel?> get onAuthStateChange =>
      firebaseAuth.authStateChanges().map((user) => convertUser(user));

  @override
  Future<UserModel?> signInwithEmailandPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      errorMessage = '';
      return convertUser(userCredential.user);
    } on FirebaseAuthException catch (ex) {
      debugPrint(ex.code);
      switch (ex.code) {
        case 'invalid-email':
          errorMessage = 'Please insert valid email adress.';
          break;
        case 'email-already-in-use':
          errorMessage = 'Email is already used by another acount.';
          break;
        case 'user-not-found':
          errorMessage = 'User is not found.';
          break;
        case 'wrong-password':
          errorMessage = 'Please check your password.';
          break;

        default:
      }
      return null;
    }
  }

  @override
  Future<bool> signOut() async {
    await firebaseAuth.signOut();
    return true;
  }
}
