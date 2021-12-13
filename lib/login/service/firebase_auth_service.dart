import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> createUserWithEmail(String email, String password) async{
    bool isCreated = false;
    try{
      print('hi');
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      if(userCredential.user != null){
        isCreated = true;
      }
    } on FirebaseAuthException catch (e){
      //firebase exception 발생 시
      print('firebase exception occurred');
    } catch (e){
      //기타 exception 발생 시
      print('other exception occurred');
      print(e);
    }

    return isCreated;
  }

}