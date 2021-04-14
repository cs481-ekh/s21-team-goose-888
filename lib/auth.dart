import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {

  Future<String> currentUser();
  Future<String> signIn(String email, String password);
  Future<String> createUser(String email, String password);
  Future<void> signOut();
  Future<void> resetPassword(String email);
}

class Auth implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> signIn(String email, String password) async {
    UserCredential userCred = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    User user = userCred.user;
    return user.uid;
  }

  Future<String> createUser(String email, String password) async {
    UserCredential userCred = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    User user = userCred.user;
    return user.uid;
  }

  Future<String> currentUser() async {
    User user = _firebaseAuth.currentUser;
    return user != null ? user.uid : null;
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  Future<void> resetPassword(String email) async{
    await _firebaseAuth.sendPasswordResetEmail(email: email);
}

}