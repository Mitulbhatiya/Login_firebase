import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseHelper{
  static final FirebaseAuth auth = FirebaseAuth.instance;

  FirebaseHelper._();
  static final FirebaseHelper instance = FirebaseHelper._();

  Future<UserCredential> registerWithEmailAndPassword({required String email, required String password})async{
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: email,password: password);
    return userCredential;
  }

  Future<UserCredential> signinWithEmailAndPassword({required String email, required String password})async {
    UserCredential userCredential = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential;
  }

  void signOutUser()async{
    await auth.signOut();
  }
}