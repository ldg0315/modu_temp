import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> createUserWithEmail(String email, String password) async{
    try{
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      if(userCredential.user != null){
        return true;
      }
    } on FirebaseAuthException catch (e){
      //firebase exception 발생 시
      print('firebase exception occurred');
    } catch (e){
      //기타 exception 발생 시
      print('other exception occurred');
      print(e);
    }

    return false;
  }

  Future<bool> signInWithEmail(String email, String password) async{
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
    if(userCredential.user != null){
      return true;
    }
    return false;
  }

  void signOut() {
    _auth.signOut();
  }

}